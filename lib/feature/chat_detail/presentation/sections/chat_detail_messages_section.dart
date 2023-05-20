import 'package:chat_astro/app/app_locale_keys.dart';
import 'package:chat_astro/feature/chat_detail/presentation/controllers/impl/chat_detail_controller_impl.dart';
import 'package:chat_astro/feature/chat_detail/presentation/widgets/chat_detail_assistent_message_bubble.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../widgets/chat_detail_user_message_bubble.dart';

class ChatDetailChatMessagesSection extends GetView<ChatDetailControllerImpl> {
  const ChatDetailChatMessagesSection({Key? key}) : super(key: key);

  ScrollController get scrollController => controller.state.scrollController;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Obx(() {
        return ListView.builder(
          controller: scrollController,
          itemCount: controller.state.messages.length,
          itemBuilder: (context, index) {
            final message = controller.state.messages[index];
            if (message.fromUser) {
              return ChatDetailUserMessageBubble(
                userMessage: message.message,
              );
            } else {
              return ChatDetailAssistantMessageBubble(
                isLast: index == controller.state.messages.length - 1,
                assistantMessage: message.message,
              );
            }
          },
        );
      }),
    );
  }
}
