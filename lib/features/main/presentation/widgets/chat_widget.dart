import 'package:flutter/material.dart';
import 'package:forens_iq/core/themes/app_colors.dart';
import 'package:forens_iq/core/themes/app_text_styles.dart';
import 'package:forens_iq/features/main/models/chat_model.dart';

class ChatWidget extends StatelessWidget {
  final ChatModel chat;
  const ChatWidget({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          chat.sender == 'AI Advisor'
              ? CircleAvatar(
                  radius: 20,
                  child: Image.asset(
                    chat.sender == 'AI Advisor'
                        ? 'assets/images/ai_advisor.png'
                        : 'assets/images/user.png',
                  ),
                )
              : SizedBox.shrink(),
          Expanded(
            child: Column(
              crossAxisAlignment: chat.sender == 'AI Advisor'
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.end,
              children: [
                Text(
                  chat.sender == 'AI Advisor' ? 'AI Advisor' : 'User',
                  style: AppTextStyles.footer,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: chat.sender == 'AI Advisor'
                        ? AppColors.brandSecondary
                        : AppColors.brand,
                  ),
                  child: Text(chat.content, style: AppTextStyles.bodyLarge),
                ),
              ],
            ),
          ),
          chat.sender != 'AI Advisor'
              ? CircleAvatar(
                  radius: 20,
                  child: Image.asset(
                    chat.sender == 'AI Advisor'
                        ? 'assets/images/ai_advisor.png'
                        : 'assets/images/user.png',
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
