import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyEmailHeader extends StatelessWidget {
  final String email;

  const VerifyEmailHeader({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Enter the 6-digit OTP sent to',
          style: GoogleFonts.manrope(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF6B6265),
            height: 20 / 16,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 22.w,
              height: 22.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Icon(
                Icons.email,
                size: 18.sp,
                color: const Color(0xFFEA4335),
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              email,
              style: GoogleFonts.manrope(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF51424A),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

