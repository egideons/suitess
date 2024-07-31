class ChatMessageModel {
  final String message;
  final bool isSender;
  final DateTime timestamp;
  // final String timestamp;

  ChatMessageModel({
    required this.message,
    required this.isSender,
    required this.timestamp,
  });
}
