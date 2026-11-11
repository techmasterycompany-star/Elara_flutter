import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:elara_flutter/core/constants/app_colors.dart';

class PartnerSignupLoginPrompt extends StatelessWidget {
  final VoidCallback onLoginTap;

  const PartnerSignupLoginPrompt({
    super.key,
    required this.onLoginTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Aleardy Hava an Account ? ',
          style: GoogleFonts.manrope(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF6B6265),
          ),
        ),
        GestureDetector(
          onTap: onLoginTap,
          child: Text(
            'Login',
            style: GoogleFonts.manrope(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.lightTextLink,
            ),
          ),
        ),
      ],
    );
  }
}

