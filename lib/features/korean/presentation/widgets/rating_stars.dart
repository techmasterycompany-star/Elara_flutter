import 'package:elara_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

/// Five stars showing [rating] out of 5, with a half star for partial values.
///
/// Values outside 0–5 are clamped, so the widget is safe to use with raw API
/// data.
class RatingStars extends StatelessWidget {
  const RatingStars({
    super.key,
    required this.rating,
    this.size = 18,
    this.color = AppColors.primary,
  });

  final double rating;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final value = rating.clamp(0.0, 5.0).toDouble();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < 5; i++)
          Icon(
            value >= i + 1
                ? Icons.star
                : (value > i ? Icons.star_half : Icons.star_border),
            size: size,
            color: color,
          ),
      ],
    );
  }
}
