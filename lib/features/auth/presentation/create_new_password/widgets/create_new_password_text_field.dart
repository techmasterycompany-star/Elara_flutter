import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateNewPasswordTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;

  const CreateNewPasswordTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(360),
        border: Border.all(
          color: const Color(0xFFD1C4C9),
          width: 1,
        ),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          style: GoogleFonts.manrope(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF1A1A1A),
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.manrope(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF6B6265),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 24.w),
            border: InputBorder.none,
            suffixIcon: suffixIcon != null
                ? Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: suffixIcon,
                  )
                : null,
            suffixIconConstraints: BoxConstraints(
              minWidth: 24.sp,
              minHeight: 24.sp,
            ),
          ),
        ),
      ),
    );
  }
}

