import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupAppBar extends StatelessWidget {
  const SignupAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: SizedBox(
        height: 40.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.menu,
                size: 24.sp,
                color: const Color(0xFF1A1A1A),
              ),
            ),
            SvgPicture.asset(
              'assets/icons/elara_logo.svg',
              height: 28.h,
              fit: BoxFit.contain,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.search,
                    size: 20.sp,
                    color: const Color(0xFF1A1A1A),
                  ),
                  SizedBox(width: 10.w),
                  SizedBox(
                    height: 18.h,
                    child: VerticalDivider(
                      width: 1,
                      thickness: 1,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Icon(
                    Icons.favorite,
                    size: 20.sp,
                    color: const Color(0xFF1A1A1A),
                  ),
                  SizedBox(width: 10.w),
                  SizedBox(
                    height: 18.h,
                    child: VerticalDivider(
                      width: 1,
                      thickness: 1,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 20.sp,
                    color: const Color(0xFF1A1A1A),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
