import 'package:flutter/material.dart';
import 'package:forens_iq/core/themes/app_colors.dart';
import 'package:forens_iq/core/themes/app_text_styles.dart';

class ScanDetailsGeneralWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  final bool threat;
  const ScanDetailsGeneralWidget({
    super.key,
    required this.content,
    required this.icon,
    required this.title,
    required this.threat,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(bottom: threat? 8 : 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16,
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.brandSecondary,
            ),
            child: Icon(icon, size: 24, color: AppColors.textPrimary),
          ),
          Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: AppTextStyles.heading5),
              Text(
                content,
                style: AppTextStyles.footer.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
