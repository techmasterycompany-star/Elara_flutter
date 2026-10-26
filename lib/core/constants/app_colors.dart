import 'package:flutter/material.dart';

abstract class AppColors {
  // ==================== Brand Colors ====================
  static const Color primary = Color(
    0xFFD98A9C,
  ); // Rose - Primary brand color[cite: 1]
  static const Color secondary = Color(
    0xFF1A1A1A,
  ); // Charcoal - Secondary brand color[cite: 1]

  // ==================== Light Mode ====================
  // Text & Surfaces (Light)
  static const Color lightTextPrimary = Color(0xFF1A1A1A); // #1A1A1A[cite: 1]
  static const Color lightTextSecondary = Color(0xFF6B6265); // #6B6265[cite: 1]
  static const Color lightBackgroundDefault = Color(
    0xFFFAF9FA,
  ); // #FAF9FA[cite: 1]
  static const Color lightBackgroundSubtle = Color(
    0xFFF3EFF0,
  ); // #F3EFF0[cite: 1]
  static const Color lightSurfaceElevated = Color(
    0xFFFFFFFF,
  ); // #FFFFFF[cite: 1]
  static const Color lightSurfaceSunken = Color(0xFFF3EFF0); // #F3EFF0[cite: 1]
  static const Color lightSurfacePrimary = Color(
    0xFFFFFFFF,
  ); // #FFFFFF[cite: 1]

  // UI Semantic - Icons & Borders (Light)
  static const Color lightIconPrimary = Color(0xFF1A1A1A); // #1A1A1A[cite: 1]
  static const Color lightIconSecondary = Color(0xFF6B6265); // #6B6265[cite: 1]
  static const Color lightIconBrand = Color(0xFF98465C); // #98465C[cite: 1]
  static const Color lightIconWhite = Color(0xFFFFFFFF); // #FFFFFF[cite: 1]
  static const Color lightIconInverse = Color(0xFFFFFFFF); // #FFFFFF[cite: 1]
  static const Color lightTextLink = Color(0xFF98465C); // #98465C[cite: 1]
  static const Color lightTextLinkHover = Color(0xFF793448); // #793448[cite: 1]

  // UI Semantic - Disabled & Borders (Light)
  static const Color lightDisabledContent = Color(
    0xFF9C9295,
  ); // #9C9295[cite: 1]
  static const Color lightDisabledBackground = Color(
    0xFFF3EFF0,
  ); // #F3EFF0[cite: 1]
  static const Color lightDisabledBorder = Color(
    0xFFE2D4DD,
  ); // #E2D4DD[cite: 1]
  static const Color lightBorderSubtle = Color(0xFFEBE0E3); // #EBE0E3[cite: 1]
  static const Color lightBorderDefault = Color(0xFFD1C4C9); // #D1C4C9[cite: 1]
  static const Color lightBorderControl = Color(0xFFBC7B81); // #BC7B81[cite: 1]
  static const Color lightBorderFocus = Color(0xFFD98A9C); // #D98A9C[cite: 1]

  // ==================== Dark Mode ====================
  // Text & Surfaces (Dark)
  static const Color darkTextPrimary = Color(0xFFF3F0F2); // #F3F0F2[cite: 1]
  static const Color darkTextSecondary = Color(0xFFB1A2A7); // #B1A2A7[cite: 1]
  static const Color darkBackgroundDefault = Color(
    0xFF171315,
  ); // #171315[cite: 1]
  static const Color darkBackgroundSubtle = Color(
    0xFF211B1E,
  ); // #211B1E[cite: 1]
  static const Color darkSurfaceElevated = Color(
    0xFF282125,
  ); // #282125[cite: 1]
  static const Color darkSurfaceSunken = Color(0xFF110E10); // #110E10[cite: 1]
  static const Color darkSurfacePrimary = Color(0xFF34212A); // #34212A[cite: 1]

  // UI Semantic - Icons & Borders (Dark)
  static const Color darkIconPrimary = Color(0xFFF3F0F2); // #F3F0F2[cite: 1]
  static const Color darkIconSecondary = Color(0xFFB1A2A7); // #B1A2A7[cite: 1]
  static const Color darkIconBrand = Color(0xFFE8A3B5); // #E8A3B5[cite: 1]
  static const Color darkIconWhite = Color(0xFFFFFFFF); // #FFFFFF[cite: 1]
  static const Color darkIconInverse = Color(0xFF1A1A1A); // #1A1A1A[cite: 1]
  static const Color darkTextLink = Color(0xFFE8A3B5); // #E8A3B5[cite: 1]
  static const Color darkTextLinkHover = Color(0xFFF2BDCC); // #F2BDCC[cite: 1]

  // UI Semantic - Disabled & Borders (Dark)
  static const Color darkTextDisabled = Color(0xFF79696E); // #79696E[cite: 1]
  static const Color darkBackgroundDisabled = Color(
    0xFF282125,
  ); // #282125[cite: 1]
  static const Color darkBorderDisabled = Color(0xFF382B36); // #382B36[cite: 1]
  static const Color darkBorderSubtle = Color(0xFF342B30); // #342B30[cite: 1]
  static const Color darkBorderDefault = Color(0xFF51424A); // #51424A[cite: 1]
  static const Color darkBorderStrong = Color(0xFF8F7A84); // #8F7A84[cite: 1]
  static const Color darkBorderFocused = Color(0xFFE8A3B5); // #E8A3B5[cite: 1]

  // ==================== Status Colors (Light) ====================
  // Success (Light)
  static const Color successForeground = Color(0xFF237A4B); // #237A4B[cite: 1]
  static const Color successBackground = Color(0xFFEDFBF1); // #EDFBF1[cite: 1]
  static const Color successBorder = Color(
    0xFFA8D6B8,
  ); // #A8D6B8 (approx from image)[cite: 1]

  // Error (Light)
  static const Color errorForeground = Color(0xFFB42318); // #B42318[cite: 1]
  static const Color errorBackground = Color(0xFFFEF3F2); // #FEF3F2[cite: 1]
  static const Color errorBorder = Color(0xFFF28883); // #F28883[cite: 1]

  // Warning (Light)
  static const Color warningForeground = Color(0xFFB76D00); // #B76D00[cite: 1]
  static const Color warningBackground = Color(0xFFFFF8E5); // #FFF8E5[cite: 1]
  static const Color warningBorder = Color(0xFFE9C884); // #E9C884[cite: 1]

  // Info (Light)
  static const Color infoForeground = Color(0xFF175CD3); // #175CD3[cite: 1]
  static const Color infoBackground = Color(0xFFEFF8FF); // #EFF8FF[cite: 1]
  static const Color infoBorder = Color(0xFFB2CCF5); // #B2CCF5[cite: 1]

  // ==================== Status Colors (Dark) ====================
  // Success (Dark)
  static const Color darkSuccessForeground = Color(
    0xFF75D6AD,
  ); // #75D6AD[cite: 1]
  static const Color darkSuccessSubtleBg = Color(
    0xFF142820,
  ); // #142820[cite: 1]
  static const Color darkSuccessBorder = Color(0xFF32654A); // #32654A[cite: 1]

  // Error (Dark)
  static const Color darkErrorForeground = Color(
    0xFFFDA29B,
  ); // #FDA29B[cite: 1]
  static const Color darkErrorSubtleBg = Color(0xFF351B1B); // #351B1B[cite: 1]
  static const Color darkErrorBorder = Color(0xFF82413B); // #82413B[cite: 1]

  // Warning (Dark)
  static const Color darkWarningForeground = Color(
    0xFFFEC84B,
  ); // #FEC84B[cite: 1]
  static const Color darkWarningSubtleBg = Color(
    0xFF302715,
  ); // #302715[cite: 1]
  static const Color darkWarningBorder = Color(0xFF75602C); // #75602C[cite: 1]

  // Info (Dark)
  static const Color darkInfoForeground = Color(0xFF84CAFF); // #84CAFF[cite: 1]
  static const Color darkInfoSubtleBg = Color(0xFF172B3D); // #172B3D[cite: 1]
  static const Color darkInfoBorder = Color(0xFF26609C); // #26609C[cite: 1]
}
