import 'package:flutter/material.dart';

// Example of another custom theme extension
@immutable
class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  const CustomThemeExtension({
    required this.customValue,
  });

  final double customValue;

  @override
  ThemeExtension<CustomThemeExtension> copyWith({
    double? customValue,
  }) {
    return CustomThemeExtension(
      customValue: customValue ?? this.customValue,
    );
  }

  @override
  ThemeExtension<CustomThemeExtension> lerp(
    ThemeExtension<CustomThemeExtension>? other,
    double t,
  ) {
    if (other is! CustomThemeExtension) {
      return this;
    }
    return CustomThemeExtension(
      customValue: customValue + (other.customValue - customValue) * t,
    );
  }

  // Access the extension from any BuildContext
  static CustomThemeExtension of(BuildContext context) {
    return Theme.of(context).extension<CustomThemeExtension>()!;
  }
}
