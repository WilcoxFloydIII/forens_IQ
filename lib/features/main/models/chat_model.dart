import 'dart:io';

class ChatModel {
  late final String sender;
  late final String content;
  late final File? attachment;

  ChatModel({
    required this.sender,
    required this.content,
    this.attachment
  });
}
