import '../../../user_creation/domain/entities/user_profile_data.dart';

class ChatData {
  final String userAvatarImagePath;
  final String assistantAvatarImagePath;
  final String initialChatMessage;
  final List<String> assistantMessages;
  final List<String> userMessages;

  ChatData({
    required this.initialChatMessage,
    required this.assistantMessages,
    required this.userMessages,
    required this.userAvatarImagePath,
    required this.assistantAvatarImagePath,
  });

  // this is when user is registred and enters chat for the first time, or new chat.
  factory ChatData.fromUserProfile(UserProfile userProfile) {
    return ChatData(
        userAvatarImagePath: userProfile.chatAvatarImagePath,
        assistantAvatarImagePath: 'assets/images/chat_detail/chat_bot_avatar.png',
        assistantMessages: [],
        initialChatMessage: userProfile.chatResponse,
        userMessages: []);
  }
}
