import 'package:elara_flutter/core/constants/app_colors.dart';
import 'package:elara_flutter/core/theme/app_typography.dart';
import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.lightBackgroundDefault,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.lightSurfacePrimary,
        error: AppColors.errorForeground,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: AppColors.lightTextPrimary,
      ),
      dividerColor: AppColors.lightBorderSubtle,
      textTheme: TextTheme(
        displayLarge: AppTypography.displayMedium.copyWith(
          color: AppColors.lightTextPrimary,
        ),
        headlineLarge: AppTypography.h1.copyWith(
          color: AppColors.lightTextPrimary,
        ),
        headlineMedium: AppTypography.h2.copyWith(
          color: AppColors.lightTextPrimary,
        ),
        headlineSmall: AppTypography.h3.copyWith(
          color: AppColors.lightTextPrimary,
        ),
        bodyLarge: AppTypography.bodyLarge.copyWith(
          color: AppColors.lightTextPrimary,
        ),
        bodyMedium: AppTypography.bodyMedium.copyWith(
          color: AppColors.lightTextPrimary,
        ),
        bodySmall: AppTypography.bodySmall.copyWith(
          color: AppColors.lightTextSecondary,
        ),
        labelSmall: AppTypography.caption.copyWith(
          color: AppColors.lightTextSecondary,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.lightSurfaceElevated,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          side: const BorderSide(color: AppColors.lightBorderSubtle),
        ),
      ),
    );
  }

  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.darkBackgroundDefault,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.darkSurfacePrimary,
        error: AppColors.darkErrorForeground,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: AppColors.darkTextPrimary,
      ),
      dividerColor: AppColors.darkBorderSubtle,
      textTheme: TextTheme(
        displayLarge: AppTypography.displayMedium.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        headlineLarge: AppTypography.h1.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        headlineMedium: AppTypography.h2.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        headlineSmall: AppTypography.h3.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        bodyLarge: AppTypography.bodyLarge.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        bodyMedium: AppTypography.bodyMedium.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        bodySmall: AppTypography.bodySmall.copyWith(
          color: AppColors.darkTextSecondary,
        ),
        labelSmall: AppTypography.caption.copyWith(
          color: AppColors.darkTextSecondary,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.darkSurfaceElevated,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          side: const BorderSide(color: AppColors.darkBorderSubtle),
        ),
      ),
    );
  }
}
