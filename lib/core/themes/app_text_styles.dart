import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const String _fontFamily = 'Space Grotesk';
  // Headings - Using Inter
  static final TextStyle heading1 = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    fontFamily: _fontFamily,
  );

  static final TextStyle heading2 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    fontFamily: _fontFamily,
  );

  static final TextStyle heading3 = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    fontFamily: _fontFamily,
  );

  static final TextStyle heading4 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    fontFamily: _fontFamily,
  );

  static final TextStyle heading5 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    fontFamily: _fontFamily,
  );

  // Body text
  static final TextStyle bodyLarge = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    fontFamily: _fontFamily,
  );

  static final TextStyle bodyMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    fontFamily: _fontFamily,
  );

  // static final TextStyle bodySmall = TextStyle(
  //   fontSize: 11.sp,
  //   fontWeight: FontWeight.normal,
  //   color: AppColors.textSecondary,
  //   fontFamily: _fontFamily,
  // );
  
  static final TextStyle footer = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    fontFamily: _fontFamily,
  );

  static final TextStyle hintText = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    fontFamily: _fontFamily,
  );

  // Buttons 
  static final TextStyle onBrandButton = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    fontFamily: _fontFamily,
  );

  static final TextStyle onSecondaryButton = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    fontFamily: _fontFamily,
  );
}
