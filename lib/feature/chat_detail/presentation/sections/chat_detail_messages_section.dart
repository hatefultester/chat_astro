import 'package:chat_astro/app/app_locale_keys.dart';
import 'package:chat_astro/feature/chat_detail/presentation/controllers/impl/chat_detail_controller_impl.dart';
import 'package:chat_astro/feature/chat_detail/presentation/widgets/chat_detail_assistent_message_bubble.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../widgets/chat_detail_user_message_bubble.dart';

class ChatDetailChatMessagesSection extends GetView<ChatDetailControllerImpl> {
  const ChatDetailChatMessagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ChatDetailAssistantMessageBubble(
          assistantMessage: tr(LocaleKey.CHAT_INITIAL_ASSISTANT_CHAT_MESSAGE),
        ),
        ChatDetailUserMessageBubble(
          userMessage: controller.state.initialChatMessage.value,
        ),
      ],
    );
  }
}
