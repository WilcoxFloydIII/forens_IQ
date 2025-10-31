import 'package:flutter/material.dart';
import 'package:forens_iq/core/themes/app_text_styles.dart';
import 'package:forens_iq/features/main/models/recent_model.dart';
import 'package:forens_iq/features/main/presentation/widgets/home_info_container.dart';
import 'package:forens_iq/features/main/presentation/widgets/home_recent_widget.dart';
import 'package:forens_iq/shared/layout/app_layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int recentAnalyses = 12;
  final int threats = 5;
  final int activeAlerts = 2;

  List<RecentModel> recents = [
    RecentModel(analysis: true, type: 'File Analysis', number: 2),
    RecentModel(analysis: true, type: 'Log Analysis', number: 1),
    RecentModel(analysis: false, type: 'Threat Detection', number: 2),
  ];

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      pageTitle: 'ForensIQ',
      children: [
        Row(children: [Text('Dashboard', style: AppTextStyles.heading2)]),
        SizedBox(height: 28),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 16,
          children: [
            HomeInfoContainer(
              name: 'Recent Analyses',
              value: recentAnalyses.toString(),
            ),
            HomeInfoContainer(
              name: 'Threats Detected',
              value: threats.toString(),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            HomeInfoContainer(
              name: 'Active Alerts',
              value: activeAlerts.toString(),
            ),
          ],
        ),
        SizedBox(height: 32),
        Row(children: [Text('Recent Activity', style: AppTextStyles.heading2)]),
        SizedBox(height: 28),
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return HomeRecentWidget(
                analysis: recents[index].analysis,
                type: recents[index].type,
                number: recents[index].number.toString(),
              );
            },
          ),
        ),
      ],
    );
  }
}
