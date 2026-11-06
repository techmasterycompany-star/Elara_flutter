import 'package:elara_flutter/core/constants/app_colors.dart';
import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductRatings extends StatelessWidget {
  const ProductRatings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Product Ratings', style: Theme.of(context).textTheme.titleMedium),
        AppSpacing.vertical12,
        Row(
          children: [
            Text('4.8', style: Theme.of(context).textTheme.titleLarge),
            AppSpacing.horizontal12,
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
            Text(
              'Based on 50 reviews',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        AppSpacing.vertical16,
        Row(
          children: [
            Text(
              'Reviews Summary',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            AppSpacing.horizontal8,
            Icon(
              Icons.verified_outlined,
              color: AppColors.lightTextPrimary,
              size: 16.sp,
            ),
          ],
        ),
        AppSpacing.vertical12,
        Text(
          'Customers say this Mascra blends beautifully and creates a soft, airbrushed finish that blurs pores and brightens under-eyes. The dual-shade format allows mixing for customized color correction. Users report it sets makeup without looking cakey, controls shine all day, and provides a filter-like effect with no flashback in photos.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
