import 'package:flutter/material.dart';
import 'package:forens_iq/features/main/models/chat_model.dart';
import 'package:forens_iq/features/main/presentation/widgets/chat_widget.dart';
import 'package:forens_iq/shared/layout/app_layout.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _chatController = TextEditingController();

  @override
  void dispose() {
    _chatController.dispose();
    super.dispose();
  }

  List<ChatModel> chats = [
    ChatModel(
      sender: 'AI Advisor',
      content:
          "Hello!  I'm  here  to  help  you  understand  the  analysis  results.  What  questions  do  you  have?",
    ),
    ChatModel(
      sender: 'User',
      content: "What's  the  possible  attack  vector  here?",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      pageTitle: 'AI Advisor',
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) {
              return ChatWidget(chat: chats[index]);
            },
          ),
        ),
      ],
    );
  }
}
