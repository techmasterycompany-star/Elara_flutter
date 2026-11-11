import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PartnerSignupGoogleRow extends StatelessWidget {
  final VoidCallback? onTap;

  const PartnerSignupGoogleRow({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sign up with ',
            style: GoogleFonts.manrope(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF6B6265),
              height: 28 / 16,
            ),
          ),
          SizedBox(width: 8.w),
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: EdgeInsets.all(8.w),
            child: SvgPicture.asset(
              'assets/icons/google.svg',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

