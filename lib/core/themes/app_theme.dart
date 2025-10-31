import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData get darkTheme {
    final baseTheme = ThemeData.dark(useMaterial3: true);

    return baseTheme.copyWith(
      // Color scheme
      colorScheme: ColorScheme.light(
        primary: AppColors.textPrimary,
        secondary: AppColors.textSecondary,
        surface: AppColors.brandBackground,
        error: AppColors.error,
        onPrimary: AppColors.textPrimary,
        onSecondary: AppColors.textSecondary,
        onSurface: AppColors.textPrimary,
        onSurfaceVariant: AppColors.textPrimary,
        onError: AppColors.textPrimary,
      ),

      // Text themes - Using Material 3 text theme structure
      textTheme: TextTheme(
        // Headings - Poppins (already applied in AppTextStyles)
        displayLarge: AppTextStyles.heading1,
        displayMedium: AppTextStyles.heading2,
        displaySmall: AppTextStyles.heading3,
        headlineLarge: AppTextStyles.heading1,
        headlineMedium: AppTextStyles.heading4,
        headlineSmall: AppTextStyles.heading5,
        // titleLarge: AppTextStyles.heading6,
        titleMedium: AppTextStyles.bodyLarge.copyWith(
          fontWeight: FontWeight.w600,
        ),
        titleSmall: AppTextStyles.bodyLarge,

        // Body - Inter (already applied in AppTextStyles)
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        bodySmall: AppTextStyles.bodyMedium,

        // Labels & Buttons - Inter (already applied in AppTextStyles)
        labelLarge: AppTextStyles.onBrandButton,
        labelMedium: AppTextStyles.bodyMedium,
        labelSmall: AppTextStyles.footer,
      ),

      // App bar theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.brand,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextStyles.heading3.copyWith(
          color: AppColors.textPrimary,
        ),
      ),

      // Button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.brand,
          foregroundColor: AppColors.textPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: AppTextStyles.onBrandButton,
        ),
      ),

      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        hintStyle: AppTextStyles.hintText,
        labelStyle: AppTextStyles.footer,
        fillColor: AppColors.brandSecondary,
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
    );
  }

  // You can add other themes like darkTheme here
  // static ThemeData get darkTheme { ... }
}
