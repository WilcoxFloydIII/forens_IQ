import 'package:flutter/material.dart';
import 'package:forens_iq/core/themes/app_colors.dart';
import 'package:forens_iq/core/themes/app_text_styles.dart';

class HomeInfoContainer extends StatefulWidget {
  final String name;
  final String value;
  const HomeInfoContainer({super.key, required this.name, required this.value});

  @override
  State<HomeInfoContainer> createState() => _HomeInfoContainerState();
}

class _HomeInfoContainerState extends State<HomeInfoContainer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.brandSecondary,
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.name, style: AppTextStyles.bodyMedium),
              Text(widget.value, style: AppTextStyles.heading2),
            ],
          ),
        ),
      ),
    );
  }
}
