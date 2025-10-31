import 'package:flutter/material.dart';
import 'package:forens_iq/core/themes/app_text_styles.dart';

class MetaDataWidget extends StatelessWidget {
  final String data;
  final String title;
  const MetaDataWidget({super.key, required this.data, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.bodyMedium),
        Text(data, style: AppTextStyles.bodyMedium),
      ],
    );
  }
}

