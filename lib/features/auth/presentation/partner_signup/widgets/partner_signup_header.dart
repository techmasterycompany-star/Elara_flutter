import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PartnerSignupHeader extends StatelessWidget {
  const PartnerSignupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/icons/elara_logo.svg',
          height: 38.h,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 10.h),
        Text(
          'Partners',
          style: GoogleFonts.manrope(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF51424A),
            letterSpacing: 0.2,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24.h),
        Text(
          'Sign Up',
          style: GoogleFonts.manrope(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF6B6265),
            height: 38 / 20,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 2.h),
        Text(
          'to start working with elare',
          style: GoogleFonts.manrope(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF51424A),
            height: 28 / 14,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

