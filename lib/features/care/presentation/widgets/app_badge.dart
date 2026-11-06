import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBadge extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final double? circular;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final Border? border;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  const AppBadge({
    super.key,
    this.onTap,
    required this.text,
    this.circular,
    this.height,
    this.width,
    this.textStyle,
    this.border,
    this.color,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          border: border,
          borderRadius: BorderRadius.circular(circular ?? 8),
        ),
        alignment: Alignment.center,
        child: Text(text, style: textStyle),
      ),
    );
  }
}
