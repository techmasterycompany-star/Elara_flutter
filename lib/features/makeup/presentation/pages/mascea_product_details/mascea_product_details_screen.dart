import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:elara_flutter/features/makeup/data/models/product_model.dart';
import 'package:elara_flutter/features/makeup/presentation/pages/mascea_product_details/widgets/add_cart.dart';
import 'package:elara_flutter/features/makeup/presentation/pages/mascea_product_details/widgets/best_seller_badge.dart';
import 'package:elara_flutter/features/makeup/presentation/pages/mascea_product_details/widgets/blush_color_picker.dart';
import 'package:elara_flutter/features/makeup/presentation/pages/mascea_product_details/widgets/product_info_how_to_use_ingredients.dart';
import 'package:elara_flutter/features/makeup/presentation/pages/mascea_product_details/widgets/product_ratings.dart';
import 'package:elara_flutter/features/makeup/presentation/pages/mascea_product_details/widgets/product_title_and_rating.dart';
import 'package:elara_flutter/features/makeup/presentation/pages/mascea_product_details/widgets/review_card.dart';
import 'package:elara_flutter/features/makeup/presentation/pages/mascea_product_details/widgets/show_product.dart';
import 'package:elara_flutter/features/makeup/presentation/widgets/app_footer.dart';
import 'package:elara_flutter/features/makeup/presentation/widgets/custom_app_bar.dart';
import 'package:elara_flutter/features/makeup/presentation/widgets/navigation_screen.dart';
import 'package:elara_flutter/features/makeup/presentation/widgets/prodect_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MasceaProductDetailsScreen extends StatefulWidget {
  final ProductModel product;
  final List<ProductModel> allProducts;
  const MasceaProductDetailsScreen({
    super.key,
    required this.product,
    required this.allProducts,
  });

  @override
  State<MasceaProductDetailsScreen> createState() =>
      _MasceaProductDetailsScreenState();
}

class _MasceaProductDetailsScreenState
    extends State<MasceaProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              child: Column(
                children: [
                  AppSpacing.vertical16,
                  NavigationScreen(),
                  AppSpacing.vertical16,
                  ShowProduct(images: widget.product.images),
                  AppSpacing.vertical16,
                  BestSellerBadge(),
                  AppSpacing.vertical16,
                  ProductTitleAndRating(),
                  AppSpacing.vertical16,
                  BlushColorPicker(),
                  AppSpacing.vertical16,
                  AddCart(),
                  AppSpacing.vertical16,
                  ProductInfoHowToUseIngredients(),
                  AppSpacing.vertical64,
                  AppSpacing.vertical64,
                  ProductRatings(),
                  AppSpacing.vertical64,
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return ReviewCard();
                    },
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                  ),
                  AppSpacing.vertical20,
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: widget.allProducts.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.58,
                        ),
                    itemBuilder: (context, index) {
                      final product = widget.allProducts[index];
                      return ProductCard(
                        key: ValueKey(product.id),
                        product: product,
                        onFavoriteTap: () {},
                        onAddToCart: () {},
                        onTap: () {},
                      );
                    },
                  ),
                ],
              ),
            ),
            AppSpacing.vertical64,
            AppFooter(),
          ],
        ),
      ),
    );
  }
}
