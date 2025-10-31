import 'package:flutter/material.dart';
import 'package:forens_iq/core/themes/app_colors.dart';
import 'package:forens_iq/core/themes/app_text_styles.dart';

class ProfileTileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? content;
  const ProfileTileWidget({
    super.key,
    required this.icon,
    required this.title,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(bottom: 0),
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
            spacing: content != null ? 4 : 0,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: AppTextStyles.heading5),
              content != null
                  ? Text(
                      content!,
                      style: AppTextStyles.footer.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    )
                  : SizedBox(height: 0),
            ],
          ),
        ],
      ),
    );
  }
}