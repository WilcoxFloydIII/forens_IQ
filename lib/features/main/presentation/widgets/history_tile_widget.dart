import 'package:flutter/material.dart';
import 'package:forens_iq/core/themes/app_colors.dart';
import 'package:forens_iq/core/themes/app_text_styles.dart';
import 'package:go_router/go_router.dart';

class HistoryTileWidget extends StatefulWidget {
  final String title;
  final String content;
  final String id;
  const HistoryTileWidget({
    super.key,
    required this.title,
    required this.content,
    required this.id,
  });

  @override
  State<HistoryTileWidget> createState() => _HistoryTileWidgetState();
}

class _HistoryTileWidgetState extends State<HistoryTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(bottom: 0),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          context.push('/history/${widget.id}');
        },
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
              child: Icon(
                Icons.insert_drive_file_outlined,
                size: 24,
                color: AppColors.textPrimary,
              ),
            ),
            Column(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.title, style: AppTextStyles.heading5),
                Text(
                  widget.content,
                  style: AppTextStyles.footer.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: 24,
                    color: AppColors.textPrimary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
