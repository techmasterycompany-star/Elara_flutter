import 'package:elara_flutter/core/constants/app_colors.dart';
import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:elara_flutter/core/network/service_locator.dart';
import 'package:elara_flutter/features/makeup/busines_logic/cubit/products_cubit.dart';
import 'package:elara_flutter/features/makeup/busines_logic/cubit/products_state.dart';
import 'package:elara_flutter/features/makeup/presentation/widgets/filter_options_bar.dart';
import 'package:elara_flutter/features/makeup/presentation/widgets/navigation_screen.dart';
import 'package:elara_flutter/features/makeup/presentation/widgets/app_badge.dart';
import 'package:elara_flutter/features/makeup/presentation/widgets/app_footer.dart';
import 'package:elara_flutter/features/makeup/presentation/widgets/custom_app_bar.dart';
import 'package:elara_flutter/features/makeup/presentation/widgets/filters_categories.dart';
import 'package:elara_flutter/features/makeup/presentation/widgets/prodect_card.dart';
import 'package:elara_flutter/features/makeup/presentation/widgets/results_count_and_sort_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TopFaceScreen extends StatefulWidget {
  final String initialCategory;

  const TopFaceScreen({super.key, this.initialCategory = 'All Product'});

  @override
  State<TopFaceScreen> createState() => _TopFaceScreenState();
}

class _TopFaceScreenState extends State<TopFaceScreen> {
  static const String _all = 'All Product';
  static const String _offer = 'Offer';

  late String _selectedCategory = widget.initialCategory;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductsCubit>()..getProducts(),
      child: Scaffold(
        backgroundColor: AppColors.lightBackgroundDefault,
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    NavigationScreen(),
                    AppSpacing.vertical16,
                    ResultsCountAndSortBar(),
                    AppSpacing.vertical16,
                    FiltersCategories(
                      selected: _selectedCategory,
                      onSelected: (c) => setState(() => _selectedCategory = c),
                    ),
                    AppSpacing.vertical16,

                    if (_selectedCategory != _all) ...[
                      FilterOptionsBar(),
                      AppSpacing.vertical16,
                    ],
                    BlocBuilder<ProductsCubit, ProductsState>(
                      builder: (context, state) {
                        if (state is ProductsLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (state is ProductsError) {
                          return Center(child: Text(state.message));
                        }

                        if (state is ProductsSuccess) {
                          final products = state.products;

                          final filteredProducts = _selectedCategory == _all
                              ? products
                              : _selectedCategory == _offer
                              ? products.where((p) => p.hasDiscount).toList()
                              : products
                                    .where(
                                      (p) =>
                                          p.category.name == _selectedCategory,
                                    )
                                    .toList();

                          return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: filteredProducts.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 16,
                                  childAspectRatio: 0.58,
                                ),
                            itemBuilder: (context, index) {
                              final product = filteredProducts[index];

                              return ProductCard(
                                key: ValueKey(product.id),
                                product: product,
                                onFavoriteTap: () {},
                                onAddToCart: () {},
                                onTap: () {
                                  context.push(
                                    '/MasceaProductDetailsScreen',
                                    extra: {
                                      'product': product,
                                      'allProducts': products,
                                    },
                                  );
                                },
                              );
                            },
                          );
                        }

                        return const SizedBox.shrink();
                      },
                    ),

                    AppSpacing.vertical12,
                    Center(
                      child: AppBadge(
                        text: 'View All',
                        border: Border.all(
                          color: AppColors.darkBorderDefault,
                          width: 1.45.w,
                        ),
                        circular: 50,
                        padding: EdgeInsets.symmetric(
                          vertical: 8.h,
                          horizontal: 16.w,
                        ),
                        width: 282.w,
                        height: 48.h,
                      ),
                    ),
                    AppSpacing.vertical32,
                  ],
                ),
              ),
              AppFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

/// صف الـ dropdown التاني (Foundation / Availability)
class SubFilters extends StatelessWidget {
  const SubFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _dropdown('Foundation', ['Foundation', 'Powder'])),
        SizedBox(width: 12.w),
        Expanded(
          child: _dropdown('Availability', ['In stock', 'Out of stock']),
        ),
      ],
    );
  }

  Widget _dropdown(String hint, List<String> items) {
    return DropdownButtonFormField<String>(
      hint: Text(hint),
      isDense: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.darkBorderDefault),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      ),
      items: items
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: (v) {},
    );
  }
}
