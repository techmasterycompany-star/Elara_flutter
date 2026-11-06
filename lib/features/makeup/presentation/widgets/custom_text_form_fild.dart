import 'package:elara_flutter/core/constants/app_colors.dart';
import 'package:elara_flutter/features/makeup/presentation/widgets/app_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFild extends StatelessWidget {
  final TextEditingController? controller;
  const CustomTextFormFild({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Your Email',
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.w),
        suffixIcon: AppBadge(
          color: AppColors.darkBackgroundDefault,
          text: 'Subscribe',
          width: 118.w,
          circular: 360,
          textStyle: TextStyle(
            color: AppColors.lightSurfaceElevated,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(360),
          borderSide: BorderSide(
            color: AppColors.lightIconBrand,
            width: 1.75.w,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(360),
          borderSide: BorderSide(
            color: AppColors.lightIconBrand,
            width: 1.75.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(360),
          borderSide: BorderSide(
            color: AppColors.lightIconBrand,
            width: 1.75.w,
          ),
        ),
      ),
    );
  }
}
