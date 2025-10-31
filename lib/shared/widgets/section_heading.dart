import 'package:flutter/material.dart';
import 'package:forens_iq/core/themes/app_text_styles.dart';

class SectionHeading extends StatelessWidget {
  final String title;
  const SectionHeading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [Text(title, style: AppTextStyles.heading3)],
    );
  }
}
