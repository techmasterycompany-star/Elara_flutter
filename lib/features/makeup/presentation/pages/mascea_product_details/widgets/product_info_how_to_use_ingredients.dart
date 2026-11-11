import 'package:elara_flutter/core/constants/app_colors.dart';
import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:elara_flutter/features/makeup/presentation/widgets/app_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductInfoHowToUseIngredients extends StatefulWidget {
  const ProductInfoHowToUseIngredients({super.key});

  @override
  State<ProductInfoHowToUseIngredients> createState() =>
      _ProductInfoHowToUseIngredientsState();
}

class _ProductInfoHowToUseIngredientsState
    extends State<ProductInfoHowToUseIngredients> {
  int selectedIndex = 0;
  Widget button(String text, int index) {
    final isSelected = selectedIndex == index;
    return AppBadge(
      height: 48.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      circular: 25.r,
      border: Border.all(color: AppColors.darkBackgroundDefault, width: 1.w),
      color: isSelected
          ? AppColors.darkBackgroundDefault
          : AppColors.lightIconWhite,
      textStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      text: text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            button('Product Info', 0),
            AppSpacing.horizontal12,
            button('How To Use', 1),
            AppSpacing.horizontal12,
            button('Ingredients', 2),
          ],
        ),
        AppSpacing.vertical16,
        Text('WHAT IT IS:', style: Theme.of(context).textTheme.titleMedium),
        Text(
          'A pop of color with a filtered finish! Blush Filter is a lightweight liquid blush with buildable pigments and finely milled micro-pearls for a soft-focus, high-impact glow.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        AppSpacing.vertical16,
        Text(
          'WHAT ELSE TO KNOW:',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          'Available in 14 shades that work across all skin tones, Blush Filter also has a yummy candy scent to complement the sweet shade names. Our innovative peanut-shaped doe-foot makes application super easy. Just apply three dots of blush on your cheeks and blend with your fingers for a multi-dimensional, pigmented finish.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
