import 'package:flutter/material.dart';
import 'package:forens_iq/core/themes/app_colors.dart';

class LearnMorePictureWidget extends StatelessWidget {
  final String image;
  const LearnMorePictureWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 239,
      decoration: BoxDecoration(
        color: AppColors.brandSecondary,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
