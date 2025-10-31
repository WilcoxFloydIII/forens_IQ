import 'dart:io';
import 'package:flutter/material.dart';

class AppPaddings {
  // Padding values
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;

  // Common padding values
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(horizontal: lg);
  static const EdgeInsets cardPadding = EdgeInsets.all(md);
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: md,
  );
  static const EdgeInsets inputPadding = EdgeInsets.symmetric(
    horizontal: md,
    vertical: sm,
  );
  static const EdgeInsets sectionPadding = EdgeInsets.symmetric(vertical: lg);

  static double quarterFull(BuildContext context, {bool isInner = true}) =>
      isInner
          ? Platform.isIOS
              ? (MediaQuery.of(context).size.height * 0.78) - 50
              : (MediaQuery.of(context).size.height * 0.81) - 50
          : Platform.isIOS
              ? MediaQuery.of(context).size.height * 0.67
              : MediaQuery.of(context).size.height * 0.70;

  // Spacing between elements
  static const double spaceBetweenElements = 16.0;
  static const double spaceBetweenSections = 32.0;

  // Border radius values
  static const double borderRadiusSm = 4.0;
  static const double borderRadiusMd = 8.0;
  static const double borderRadiusLg = 10.0;
  static const double borderRadiusXl = 12.0;
  static const double borderRadiusXxl = 16.0;

  // App bar
  static const EdgeInsets appBarPadding = EdgeInsets.symmetric(
    horizontal: md,
    vertical: sm,
  );
}
