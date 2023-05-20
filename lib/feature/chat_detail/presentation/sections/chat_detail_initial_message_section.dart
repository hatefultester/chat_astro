import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatDetailInitialMessageSection extends StatelessWidget {
  final RxString initialMessage;

  const ChatDetailInitialMessageSection(
      {super.key, required this.initialMessage});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Text(initialMessage.value,
          style: const TextStyle(color: Colors.white));
    });
  }
}
