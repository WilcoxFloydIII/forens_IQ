import 'package:flutter/material.dart';

class LearnMoreContentWidget extends StatelessWidget {
  final String content;
  const LearnMoreContentWidget({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Expanded(child: Container(child: Text(content)))],
    );
  }
}
