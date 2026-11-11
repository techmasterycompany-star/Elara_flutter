import 'package:elara_flutter/core/constants/app_colors.dart';
import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:elara_flutter/features/makeup/presentation/widgets/app_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCart extends StatelessWidget {
  const AddCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 40.h,
              width: 128.w,
              decoration: BoxDecoration(
                color: AppColors.backgroundColorPeople,
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.remove,
                    color: AppColors.darkBackgroundDefault,
                    size: 20.sp,
                  ),
                  AppSpacing.horizontal8,
                  Text('1', style: Theme.of(context).textTheme.bodyLarge),
                  AppSpacing.horizontal8,
                  Icon(
                    Icons.add,
                    color: AppColors.darkBackgroundDefault,
                    size: 20.sp,
                  ),
                ],
              ),
            ),
            AppSpacing.horizontal16,
            Text(
              'Current Stock: 30',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),

        AppSpacing.vertical16,
        AppBadge(
          text: 'Add to Cart',
          onTap: () {},
          color: AppColors.darkBackgroundDefault,
          circular: 25,
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
