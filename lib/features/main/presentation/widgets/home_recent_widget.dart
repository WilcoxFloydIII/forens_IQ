import 'package:flutter/material.dart';
import 'package:forens_iq/core/themes/app_colors.dart';
import 'package:forens_iq/core/themes/app_text_styles.dart';

class HomeRecentWidget extends StatelessWidget {
  final bool analysis;
  final String type;
  final String number;
  const HomeRecentWidget({
    super.key,
    required this.analysis,
    required this.type,
    required this.number,
  });

  String text() {
    if (type.toLowerCase() == 'file analysis')
      return 'Analysed $number files';
    else if (type.toLowerCase() == 'log analysis')
      return 'Analysed $number logs';
    else
      return 'Detected $number threats';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16,
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.brandSecondary,
            ),
            child: Icon(
              analysis
                  ? Icons.insert_drive_file_outlined
                  : Icons.shield_outlined,
              size: 24,
              color: AppColors.textPrimary,
            ),
          ),
          Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(type, style: AppTextStyles.heading5),
              Text(text(), style: AppTextStyles.footer),
            ],
          ),
        ],
      ),
    );
  }
}
