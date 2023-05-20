import '../../../user_creation/domain/entities/user_profile_data.dart';

class ChatData {
  final String initialChatMessage;
  final List<String> assistantMessages;
  final List<String> userMessages;

  ChatData(
      {required this.initialChatMessage,
      required this.assistantMessages,
      required this.userMessages});

  // this is when user is registred and enters chat for the first time, or new chat.
  factory ChatData.fromUserProfile(UserProfile userProfile) {
    return ChatData(
        assistantMessages: [],
        initialChatMessage: userProfile.chatResponse,
        userMessages: []);
  }
}
