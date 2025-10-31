import 'package:flutter/material.dart';
import 'package:forens_iq/core/themes/app_text_styles.dart';
import 'package:forens_iq/features/main/presentation/widgets/add_metadata_row.dart';
import 'package:forens_iq/features/main/presentation/widgets/hidden_data_row.dart';
import 'package:forens_iq/routes/route_names.dart';
import 'package:forens_iq/shared/layout/app_layout.dart';
import 'package:go_router/go_router.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  bool analysing = false;
  int completion = 0;
  String fileName = 'None';
  String fileType = 'None';
  double fileSize = 0;
  bool steganography = false;
  bool embeddedFiles = false;

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      pageTitle: 'File Analysis',
      trailing: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          context.pushNamed(RouteName.aiChat);
        },
        child: Icon(Icons.smart_toy_outlined),
      ),
      children: [
        Row(children: [Text('Upload File', style: AppTextStyles.heading3)]),
        SizedBox(height: 16),
        TextFormField(
          readOnly: true,
          decoration: InputDecoration(hintText: 'Choose File'),
          onTap: () {},
        ),
        SizedBox(height: 16),
        analysing
            ? Text('Analysing...', style: AppTextStyles.heading5)
            : SizedBox.shrink(),
        analysing ? LinearProgressIndicator() : SizedBox.shrink(),
        analysing
            ? Text('$completion% Complete', style: AppTextStyles.footer)
            : SizedBox.shrink(),
        analysing ? SizedBox(height: 16) : SizedBox.shrink(),
        Row(
          children: [Text('Extracted Metadata', style: AppTextStyles.heading3)],
        ),
        SizedBox(height: 16),
        AddMetadataRow(title: 'File Name', data: fileName),
        SizedBox(height: 16),
        AddMetadataRow(title: 'File Type', data: fileType),
        SizedBox(height: 16),
        AddMetadataRow(title: 'File Size', data: '$fileSize MB'),
        SizedBox(height: 24),
        Row(children: [Text('Hidden Data', style: AppTextStyles.heading3)]),
        SizedBox(height: 16),
        HiddenDataRow(title: 'Steganography', data: steganography),
        SizedBox(height: 16),
        HiddenDataRow(title: 'Embedded Files', data: embeddedFiles),
        SizedBox(height: 24),
        Row(children: [Text('Origin Trail', style: AppTextStyles.heading3)]),
        SizedBox(height: 16),
        Row(children: [Expanded(child: Text("No trail found."))]),
      ],
    );
  }
}
