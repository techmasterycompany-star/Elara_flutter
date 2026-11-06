import 'package:elara_flutter/core/constants/app_colors.dart';
import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTitleAndRating extends StatelessWidget {
  const ProductTitleAndRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Huda Beauty Blush Filter Liquid Blush',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        AppSpacing.vertical12,
        Row(
          children: [
            Text('Size: 50 ml', style: Theme.of(context).textTheme.bodyLarge),
            Container(
              height: 24,
              width: 1,
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              color: AppColors.lightTextSecondary,
            ),
            Icon(
              Icons.star,
              color: AppColors.darkBackgroundDefault,
              size: 20.sp,
            ),
            Icon(
              Icons.star,
              color: AppColors.darkBackgroundDefault,
              size: 20.sp,
            ),
            Icon(
              Icons.star,
              color: AppColors.darkBackgroundDefault,
              size: 20.sp,
            ),
            Icon(
              Icons.star,
              color: AppColors.darkBackgroundDefault,
              size: 20.sp,
            ),
            Icon(
              Icons.star,
              color: AppColors.darkBackgroundDefault,
              size: 20.sp,
            ),
            AppSpacing.horizontal8,
            Text('4.6', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
        AppSpacing.vertical20,
        Text('\$200.00', style: Theme.of(context).textTheme.titleMedium),
        AppSpacing.vertical8,
        Container(
          height: 55.h,
          width: 370.w,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: AppColors.backgroundColorPeople,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.people_alt_outlined,
                color: AppColors.darkBorderStrong,
                size: 20.sp,
              ),
              AppSpacing.horizontal8,
              Text(
                '50 people have purched this product ',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
