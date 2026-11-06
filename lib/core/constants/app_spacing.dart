import 'package:flutter/material.dart';

abstract class AppSpacing {
  // Korean spacing values
  static const double xxxs = 2.0;
  static const double xxs = 4.0;
  static const double xs = 8.0;
  static const double sm = 12.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
  static const double xxxl = 64.0;

  // Makeup and Care spacing values
  static const double iconTextGap = 8.0;
  static const double titleToDescription = 12.0;

  static const double cardPadding = 24.0;
  static const double cardGapSmall = 20.0;
  static const double cardGapLarge = 32.0;

  static const double headerGap = 64.0;
  static const double sectionGap = 32.0;

  static const double sectionInternalPadding = 24.0;
  static const double menuToSectionsGap = 32.0;
  static const double footerToSectionsGap = 64.0;

  // Border Radius
  static const double radiusTiny = 4.0;
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 10.0;
  static const double radiusLarge = 12.0;
  static const double radiusXLarge = 16.0;
  static const double radiusFull = 999.0;

  // Vertical SizedBox Helpers
  static const SizedBox vertical2 = SizedBox(height: 2.0);
  static const SizedBox vertical4 = SizedBox(height: 4.0);
  static const SizedBox vertical8 = SizedBox(height: iconTextGap);
  static const SizedBox vertical12 = SizedBox(height: titleToDescription);
  static const SizedBox vertical16 = SizedBox(height: 16.0);
  static const SizedBox vertical20 = SizedBox(height: cardGapSmall);
  static const SizedBox vertical24 = SizedBox(height: sectionInternalPadding);
  static const SizedBox vertical32 = SizedBox(height: sectionGap);
  static const SizedBox vertical40 = SizedBox(height: 40.0);
  static const SizedBox vertical48 = SizedBox(height: 48.0);
  static const SizedBox vertical64 = SizedBox(height: headerGap);

  // Horizontal SizedBox Helpers
  static const SizedBox horizontal2 = SizedBox(width: 2.0);
  static const SizedBox horizontal4 = SizedBox(width: 4.0);
  static const SizedBox horizontal8 = SizedBox(width: iconTextGap);
  static const SizedBox horizontal12 = SizedBox(width: titleToDescription);
  static const SizedBox horizontal16 = SizedBox(width: 16.0);
  static const SizedBox horizontal24 = SizedBox(width: sectionInternalPadding);
  static const SizedBox horizontal32 = SizedBox(width: sectionGap);
}

abstract class AppRadius {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 24.0;
  static const double full = 999.0;
}
