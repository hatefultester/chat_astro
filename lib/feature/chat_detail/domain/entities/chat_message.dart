enum ChatMessageOwner {
  assistant,
  user;

  isUser() => this == user;
}

class ChatMessage {
  final String message;
  final ChatMessageOwner owner;

  bool get fromUser => owner.isUser();

  ChatMessage({required this.message, required this.owner});
}
