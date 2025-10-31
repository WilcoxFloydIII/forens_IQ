import 'package:flutter/material.dart';
import 'package:forens_iq/features/auth/presentation/widgets/learn_more_content_widget.dart';
import 'package:forens_iq/features/auth/presentation/widgets/learn_more_picture_widget.dart';
import 'package:forens_iq/shared/layout/app_layout.dart';
import 'package:forens_iq/shared/widgets/section_heading.dart';

class LearnMoreScreen extends StatelessWidget {
  const LearnMoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      pageTitle: 'Learn More',
      children: [
        Expanded(
          child: ListView(
            children: [
              SectionHeading(title: 'AI File Analysis Engine'),
              SizedBox(height: 16),
              LearnMoreContentWidget(
                content:
                    'Our AI File Analysis Engine uses advanced machine learning algorithms to analyze files, identifying potential threats and extracting valuable forensic information. It supports a wide range of file types and provides detailed reports on file behavior and characteristics.',
              ),
              SizedBox(height: 16),
              LearnMorePictureWidget(image: ''),
              SizedBox(height: 24),
              SectionHeading(title: 'Log Intelligence System'),
              SizedBox(height: 16),
              LearnMoreContentWidget(
                content:
                    'The Log Intelligence System processes system logs and network artifacts to detect anomalies and suspicious activities. It uses AI to correlate events across different logs, providing a comprehensive view of potential security incidents.',
              ),
              SizedBox(height: 16),
              LearnMorePictureWidget(image: ''),
              SizedBox(height: 24),
              SectionHeading(title: 'Threat Correkation'),
              SizedBox(height: 16),
              LearnMoreContentWidget(
                content:
                    "ForensIQ's Threat Correlation feature integrates data from various sources, including file analysis and log intelligence, to identify and prioritize threats. It provides a unified view of security risks, enabling faster and more effective incident response.",
              ),
              SizedBox(height: 16),
              LearnMorePictureWidget(image: ''),
              SizedBox(height: 24),
              SectionHeading(title: 'AI Advisor Chat'),
              SizedBox(height: 16),
              LearnMoreContentWidget(
                content:
                    'The AI Advisor Chat is an interactive tool that provides real-time assistance and insights during investigations. It uses natural language processing to answer questions, offer recommendations, and guide users through complex forensic analysis tasks.',
              ),
              SizedBox(height: 16),
              LearnMorePictureWidget(image: ''),
            ],
          ),
        ),
      ],
    );
  }
}
