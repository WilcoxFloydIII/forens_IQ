import 'package:flutter/material.dart';
import 'package:forens_iq/core/themes/app_text_styles.dart';

class HiddenDataRow extends StatelessWidget {
  final String title;
  final bool data;
  const HiddenDataRow({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(title, style: AppTextStyles.bodyLarge,),
      Text(data? 'Detected' : 'None', style: AppTextStyles.bodyLarge,)
    ],);
  }
}
