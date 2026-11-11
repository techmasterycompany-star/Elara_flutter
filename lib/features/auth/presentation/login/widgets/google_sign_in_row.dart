import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleSignInRow extends StatelessWidget {
  final VoidCallback? onTap;

  const GoogleSignInRow({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Login with :',
          style: GoogleFonts.manrope(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF6B6265),
            height: 28 / 16,
          ),
        ),
        SizedBox(width: 8.w),
        GestureDetector(
          onTap: onTap,
          child: SvgPicture.asset(
            'assets/icons/google.svg',
            width: 44.w,
            height: 44.h,
          ),
        ),
      ],
    );
  }
}
