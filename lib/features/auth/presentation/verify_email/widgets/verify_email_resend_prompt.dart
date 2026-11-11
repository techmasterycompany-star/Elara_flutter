import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyEmailResendPrompt extends StatelessWidget {
  final VoidCallback onResendTap;

  const VerifyEmailResendPrompt({
    super.key,
    required this.onResendTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Didn’t get the OTP ?',
          style: GoogleFonts.manrope(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF51424A),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 6.h),
        GestureDetector(
          onTap: onResendTap,
          child: Text(
            'Resend OTP via email',
            style: GoogleFonts.manrope(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1976D2),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

