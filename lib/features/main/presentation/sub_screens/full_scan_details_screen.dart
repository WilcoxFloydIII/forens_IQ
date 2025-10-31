import 'package:flutter/material.dart';
import 'package:forens_iq/core/themes/app_text_styles.dart';
import 'package:forens_iq/features/main/models/scan_model.dart';
import 'package:forens_iq/features/main/presentation/widgets/metadata_row.dart';
import 'package:forens_iq/features/main/presentation/widgets/scan_details_general_widget.dart';
import 'package:forens_iq/shared/layout/app_layout.dart';

class FullScanDetailsScreen extends StatefulWidget {
  final String id;
  const FullScanDetailsScreen({super.key, required this.id});

  @override
  State<FullScanDetailsScreen> createState() => _FullScanDetailsScreenState();
}

class _FullScanDetailsScreenState extends State<FullScanDetailsScreen> {
  List<ScanModel> scans = [
    ScanModel(
      id: '12345',
      fileName: 'malware.exe',
      fileSize: 1.2,
      fileType: 'Executable',
      firstSeen: DateTime(2025, 10, 29, 10, 30, 0),
      hashMD5: 'a1b2c3d4e5f6',
      hashSHA256: 'f6e5d4c3b2a1',
      logs: [
        Log(
          info: 'Process started: malware.exe',
          time: DateTime(2025, 10, 29, 10, 37),
        ),
        Log(
          info: 'API call: CreateRemoteThread',
          time: DateTime(2025, 10, 29, 10, 36),
        ),
        Log(
          info: 'Network connection: 192.168.1.100:443',
          time: DateTime(2025, 10, 29, 10, 35),
        ),
        Log(
          info: 'File modified: C:\Windows\System32\svchost.exe',
          time: DateTime(2025, 10, 29, 10, 34),
        ),
      ],
      threatCorrelations: [
        ThreatCorrelation(
          info: 'Associated with Lazarus Group',
          type: 'APT Group',
        ),
        ThreatCorrelation(
          info: 'Identified as WannaCry Variant',
          type: 'Malware Family',
        ),
      ],
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
      threatCorrelations: [
        ThreatCorrelation(
          info: 'Associated with Lazarus Group',
          type: 'APT Group',
        ),
        ThreatCorrelation(
          info: 'Identified as WannaCry Variant',
          type: 'Malware Family',
        ),
      ],
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
      threatCorrelations: [
        ThreatCorrelation(
          info: 'Associated with Lazarus Group',
          type: 'APT Group',
        ),
        ThreatCorrelation(
          info: 'Identified as WannaCry Variant',
          type: 'Malware Family',
        ),
      ],
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
      threatCorrelations: [
        ThreatCorrelation(
          info: 'Associated with Lazarus Group',
          type: 'APT Group',
        ),
        ThreatCorrelation(
          info: 'Identified as WannaCry Variant',
          type: 'Malware Family',
        ),
      ],
      apiCalls: 'high',
      fileModification: 'medium',
      networkActivity: 'low',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = scans.firstWhere((scan) => scan.id == widget.id);
    return AppLayout(
      pageTitle: 'Full Scan Details',
      children: [
        Expanded(
          child: ListView(
            children: [
              Text('File Metadata', style: AppTextStyles.heading4),
              SizedBox(height: 16),
              MetadataRow(
                data1: scan.fileName,
                title1: 'File Name',
                data2: '${scan.fileSize} MB',
                title2: 'File Size',
              ),
              SizedBox(height: 4),
              MetadataRow(
                data1: scan.fileType,
                title1: 'File Type',
                data2: scan.hashMD5,
                title2: 'MD5 Hash',
              ),
              SizedBox(height: 4),
              MetadataRow(
                data1: scan.hashSHA256,
                title1: 'SHA256 Hash',
                data2: scan.firstSeen.toUtc().toIso8601String(),
                title2: 'First Seen',
              ),
              SizedBox(height: 24),
              Text('Anomaly Detection', style: AppTextStyles.heading4),
              SizedBox(height: 16),
              ScanDetailsGeneralWidget(
                content: scan.apiCalls,
                icon: Icons.security_outlined,
                title: 'Suspicious API Calls',
                threat: false,
              ),
              SizedBox(height: 8),
              ScanDetailsGeneralWidget(
                content: scan.networkActivity,
                icon: Icons.wifi_off_rounded,
                title: 'Unusual Network Activity',
                threat: false,
              ),
              SizedBox(height: 8),
              ScanDetailsGeneralWidget(
                content: scan.fileModification,
                icon: Icons.insert_drive_file_outlined,
                title: 'File Modification',
                threat: false,
              ),
              SizedBox(height: 24),
              Text('Threat Correlations', style: AppTextStyles.heading4),
              SizedBox(height: 16),
              ...List.generate(scan.threatCorrelations.length, (index) {
                final ThreatCorrelation threat = scan.threatCorrelations[index];
                return ScanDetailsGeneralWidget(
                  threat: true,
                  content: threat.type,
                  icon: threat.type.toLowerCase() == 'apt group'
                      ? Icons.people_outline_rounded
                      : Icons.settings_outlined,
                  title: threat.info,
                );
              }),
              SizedBox(height: 24),
              Text('Raw Log Snippets', style: AppTextStyles.heading4),
              SizedBox(height: 16),
              ...List.generate(scan.logs.length, (index) {
                scan.logs.sort((a, b) => b.time.compareTo(a.time));
                final Log log = scan.logs[index];
                return Text(
                  '${log.time.toUtc().toIso8601String()}: ${log.info}',
                  style: AppTextStyles.bodyLarge,
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
