import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

const Color loadingBarColor = Color.fromARGB(255, 255, 140, 105);
const Color textColor = Color.fromARGB(255, 255, 150, 38);

class ChatDetailLoadingWidget extends StatelessWidget {
  final String text;

  const ChatDetailLoadingWidget({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LoadingAnimationWidget.dotsTriangle(
            color: loadingBarColor,
            size: 70,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            tr(text),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, color: textColor),
          )
        ],
      ),
    );
  }
}
