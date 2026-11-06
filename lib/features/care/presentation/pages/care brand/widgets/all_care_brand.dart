import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllCareBrand extends StatelessWidget {
  final String text;
  const AllCareBrand({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppSpacing.vertical12,
        Text(text),
        Row(
          children: [
            Image.asset(
              "assets/images/brand-nivea.png",
              height: 46.h,
              width: 82.w,
            ),
            AppSpacing.horizontal8,
            Image.asset(
              "assets/images/all-haramain.png",
              height: 124.h,
              width: 157.w,
            ),
            AppSpacing.horizontal8,
            Image.asset("assets/images/A313.png", height: 96.h, width: 121.w),
          ],
        ),
        AppSpacing.vertical12,
        Row(
          children: [
            Image.asset(
              "assets/images/top-face.png",
              height: 46.h,
              width: 82.w,
            ),
            AppSpacing.horizontal8,
            Image.asset(
              "assets/images/all-haramain.png",
              height: 124.h,
              width: 157.w,
            ),
            AppSpacing.horizontal8,
            Image.asset("assets/images/A313.png", height: 96.h, width: 121.w),
          ],
        ),
        AppSpacing.vertical12,
        Row(
          children: [
            Image.asset(
              "assets/images/top-face.png",
              height: 46.h,
              width: 82.w,
            ),
            AppSpacing.horizontal8,
            Image.asset("assets/images/A313.png", height: 96.h, width: 121.w),
          ],
        ),
      ],
    );
  }
}
