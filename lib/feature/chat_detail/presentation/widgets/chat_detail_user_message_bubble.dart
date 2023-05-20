import 'package:chat_astro/feature/chat_detail/presentation/controllers/impl/chat_detail_controller_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatDetailUserMessageBubble extends GetView<ChatDetailControllerImpl> {
  final String userMessage;

  const ChatDetailUserMessageBubble({super.key, required this.userMessage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
          trailing: SizedBox(
            child: Image.asset(controller.state.userImagePath),
          ),
          title: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.33),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Text(
              userMessage,
              style: const TextStyle(color: Colors.white),
            ),
          )),
    );
  }
}
