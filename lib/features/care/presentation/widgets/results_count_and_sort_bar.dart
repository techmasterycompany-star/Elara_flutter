import 'package:elara_flutter/core/constants/app_colors.dart';
import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:elara_flutter/features/makeup/presentation/widgets/app_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultsCountAndSortBar extends StatelessWidget {
  const ResultsCountAndSortBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppBadge(
          onTap: () {},
          text: '52Result',
          textStyle: Theme.of(context).textTheme.titleSmall,
        ),
        Spacer(),
        Container(
          width: 171.w,
          height: 40.h,
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightBorderSubtle, width: 1.w),
            borderRadius: BorderRadius.circular(29),
          ),
          child: Row(
            children: [
              Text(
                'Most Popular',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              AppSpacing.horizontal4,
              Icon(
                Icons.arrow_drop_down_sharp,
                color: AppColors.lightTextPrimary,
                size: 26,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
