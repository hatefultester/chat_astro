import 'package:chat_astro/feature/chat_detail/presentation/controllers/impl/chat_detail_controller_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/typewrite_stream_effect.dart';

class ChatDetailAssistantMessageBubble
    extends GetView<ChatDetailControllerImpl> {
  final String assistantMessage;
  final bool isLast;

  const ChatDetailAssistantMessageBubble({
    super.key,
    required this.assistantMessage,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    if (isLast) {
      controller.handleAssistentMessageStarted();
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: SizedBox(
          child: Image.asset(controller.state.assistantImagePath),
        ),
        title: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.grey[300], // lighter color for the other user
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.33),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: isLast
              ? StreamBuilder<String>(
                  stream: typeWriterText(assistantMessage),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      controller.handleAssistentMessageWritten();
                    }

                    return Text(
                      snapshot.data ?? '',
                      textAlign: TextAlign.justify,
                      style: const TextStyle(color: Colors.black),
                    );
                  })
              : Text(
                  assistantMessage,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(color: Colors.black),
                ),
        ),
      ),
    );
  }
}
