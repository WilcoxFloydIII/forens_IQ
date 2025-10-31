import 'package:flutter/material.dart';
import 'package:forens_iq/core/themes/app_colors.dart';
import 'package:forens_iq/features/main/presentation/widgets/scan_details_metadata_widget.dart';

class MetadataRow extends StatelessWidget {
  final String data1;
  final String title1;
  final String data2;
  final String title2;
  const MetadataRow({
    super.key,
    required this.data1,
    required this.title1,
    required this.data2,
    required this.title2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: AppColors.divider),
        SizedBox(height: 4),
        Row(
          children: [
            Expanded(
              child: MetaDataWidget(data: data1, title: title1),
            ),
            Expanded(
              child: MetaDataWidget(data: data2, title: title2),
            ),
          ],
        ),
      ],
    );
  }
}
