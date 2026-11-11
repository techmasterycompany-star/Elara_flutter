import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordSuccessMessage extends StatelessWidget {
  const PasswordSuccessMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Text(
        'Your password successfully change',
        style: GoogleFonts.manrope(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF51424A),
          height: 28 / 18,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

