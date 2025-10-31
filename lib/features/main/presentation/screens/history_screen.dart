import 'package:flutter/material.dart';
import 'package:forens_iq/features/main/models/scan_model.dart';
import 'package:forens_iq/features/main/presentation/widgets/history_day_widget.dart';
import 'package:forens_iq/shared/layout/app_layout.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<ScanModel> scans = [
    ScanModel(
      id: '12345',
      fileName: 'malware.exe',
      fileSize: 1.2,
      fileType: 'Executable',
      firstSeen: DateTime(2025, 10, 29, 10, 30, 0),
      hashMD5: 'a1b2c3d4e5f6',
      hashSHA256: 'f6e5d4c3b2a1',
      logs: [Log(info: '', time: DateTime(2025))],
      threatCorrelations: [ThreatCorrelation(info: '', type: '')],
      apiCalls: 'high',
      fileModification: 'medium',
      networkActivity: 'low',
    ),
    ScanModel(
      id: '12345',
      fileName: 'malware.exe',
      fileSize: 1.2,
      fileType: 'Executable',
      firstSeen: DateTime(2025, 10, 29, 10, 30, 0),
      hashMD5: 'a1b2c3d4e5f6',
      hashSHA256: 'f6e5d4c3b2a1',
      logs: [Log(info: '', time: DateTime(2025))],
      threatCorrelations: [ThreatCorrelation(info: '', type: '')],
      apiCalls: 'high',
      fileModification: 'medium',
      networkActivity: 'low',
    ),
    ScanModel(
      id: '12345',
      fileName: 'malware.exe',
      fileSize: 1.2,
      fileType: 'Executable',
      firstSeen: DateTime(2025, 01, 15, 10, 30, 0),
      hashMD5: 'a1b2c3d4e5f6',
      hashSHA256: 'f6e5d4c3b2a1',
      logs: [Log(info: '', time: DateTime(2025))],
      threatCorrelations: [ThreatCorrelation(info: '', type: '')],
      apiCalls: 'high',
      fileModification: 'medium',
      networkActivity: 'low',
    ),
    ScanModel(
      id: '12345',
      fileName: 'malware.exe',
      fileSize: 1.2,
      fileType: 'Executable',
      firstSeen: DateTime(2025, 01, 15, 10, 30, 0),
      hashMD5: 'a1b2c3d4e5f6',
      hashSHA256: 'f6e5d4c3b2a1',
      logs: [Log(info: '', time: DateTime(2025))],
      threatCorrelations: [ThreatCorrelation(info: '', type: '')],
      apiCalls: 'high',
      fileModification: 'medium',
      networkActivity: 'low',
    ),
  ];

  Map<DateTime, List<ScanModel>> groupScansByDay(List<ScanModel> scans) {
    final Map<DateTime, List<ScanModel>> grouped = {};

    for (var scan in scans) {
      final date = DateTime(
        scan.firstSeen.year,
        scan.firstSeen.month,
        scan.firstSeen.day,
      );

      grouped.putIfAbsent(date, () => []);
      grouped[date]!.add(scan);
    }

    // Sort scans within each day (newest first)
    for (var list in grouped.values) {
      list.sort((a, b) => b.firstSeen.compareTo(a.firstSeen));
    }

    return grouped;
  }

  @override
  Widget build(BuildContext context) {
    final groupedScans = groupScansByDay(scans);
    final groupedEntries = groupedScans.entries.toList()
      ..sort((a, b) => b.key.compareTo(a.key));
    return AppLayout(
      pageTitle: 'History',
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: groupedEntries.length,
            itemBuilder: (context, index) {
              final entry = groupedEntries[index];
              final day = entry.key;
              final scansForDay = entry.value;
              return HistoryDayWidget(day: day, scans: scansForDay);
            },
          ),
        ),
      ],
    );
  }
}
