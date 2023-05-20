import 'package:chat_astro/feature/chat_detail/domain/entities/chat_message.dart';

import '../../../user_creation/domain/entities/user_profile_data.dart';

class ChatData {
  final String userAvatarImagePath;
  final String assistantAvatarImagePath;
  final List<ChatMessage> messages;

  ChatData({
    required this.messages,
    required this.userAvatarImagePath,
    required this.assistantAvatarImagePath,
  });

  // this is when user is registred and enters chat for the first time, or new chat.
  factory ChatData.fromUserProfile(UserProfile userProfile) {
    return ChatData(
      userAvatarImagePath: userProfile.chatAvatarImagePath,
      assistantAvatarImagePath: 'assets/images/chat_detail/chat_bot_avatar.png',
      messages: [
        ChatMessage(
            message: userProfile.chatResponse,
            owner: ChatMessageOwner.assistant),
      ],
    );
  }

  factory ChatData.fromMessages(
      {required List<ChatMessage> messages, required String userAvatar}) {
    return ChatData(
      userAvatarImagePath: userAvatar,
      assistantAvatarImagePath: 'assets/images/chat_detail/chat_bot_avatar.png',
      messages: messages,
    );
  }
}
