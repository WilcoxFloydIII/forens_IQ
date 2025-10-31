import 'package:flutter/material.dart';
import 'package:forens_iq/core/themes/app_colors.dart';
import 'package:forens_iq/core/themes/app_text_styles.dart';

class AddMetadataRow extends StatelessWidget {
  final String title;
  final String data;
  const AddMetadataRow({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: AppColors.divider),
        SizedBox(height: 4),
        Text(
          title,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        Text(data, style: AppTextStyles.bodyMedium),
      ],
    );
  }
}
