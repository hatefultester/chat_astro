import 'package:chat_astro/feature/chat_detail/presentation/controllers/impl/chat_detail_controller_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatDetailAssistantMessageBubble
    extends GetView<ChatDetailControllerImpl> {
  final String assistantMessage;

  const ChatDetailAssistantMessageBubble(
      {super.key, required this.assistantMessage});

  @override
  Widget build(BuildContext context) {
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
            child: Text(
              assistantMessage,
              style: const TextStyle(color: Colors.black),
            ),
          )),
    );
  }
}
