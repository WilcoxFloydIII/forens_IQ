import 'package:flutter/material.dart';
import 'package:forens_iq/core/themes/app_text_styles.dart';
import 'package:forens_iq/features/main/models/scan_model.dart';
import 'package:forens_iq/features/main/presentation/widgets/history_tile_widget.dart';

class HistoryDayWidget extends StatefulWidget {
  final DateTime day;
  final List<ScanModel> scans;
  const HistoryDayWidget({super.key, required this.day, required this.scans});

  @override
  State<HistoryDayWidget> createState() => _HistoryDayWidgetState();
}

class _HistoryDayWidgetState extends State<HistoryDayWidget> {
  bool isSameDate(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  String dayLabel() {
    final now = DateTime.now();
    if (isSameDate(widget.day, now)) {
      return 'Today';
    } else if (isSameDate(widget.day, now.subtract(const Duration(days: 1)))) {
      return 'Yesterday';
    } else {
      return '${widget.day.day}/${widget.day.month}/${widget.day.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(bottom: 16),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(dayLabel(), style: AppTextStyles.heading4),
          Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(widget.scans.length, (index) {
              final List<ScanModel> scans = widget.scans;
              scans.sort((a, b) => b.firstSeen.compareTo(a.firstSeen));
              final ScanModel scan = scans[index];
              return HistoryTileWidget(
                title: scan.fileName,
                content: scan.fileType,
                id: scan.id,
              );
            }),
          ),
        ],
      ),
    );
  }
}
