import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateNewPasswordHeader extends StatelessWidget {
  const CreateNewPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Creat Your Account',
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
          'Sing up to get start',
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

