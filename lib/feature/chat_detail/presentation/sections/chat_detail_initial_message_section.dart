import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/typewrite_stream_effect.dart';

class ChatDetailInitialMessageSection extends StatelessWidget {
  final RxString initialMessage;

  const ChatDetailInitialMessageSection(
      {super.key, required this.initialMessage});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: StreamBuilder<String>(
        stream: typeWriterText(initialMessage.value),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return Container(
            margin: const EdgeInsets.all(12),
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
            child: Text(snapshot.data ?? '',
                style: const TextStyle(color: Colors.black)),
          );
        },
      ),
    );
  }
}
