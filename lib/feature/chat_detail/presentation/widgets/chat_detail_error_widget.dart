import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

const Color loadingBarColor = Color.fromARGB(255, 255, 140, 105);
const Color textColor = Color.fromARGB(255, 255, 150, 38);

class ChatDetailErrorWidget extends StatelessWidget {
  final String errorMessage;
  final String tryAgainText;
  final VoidCallback? tryAgain;

  const ChatDetailErrorWidget(
      {Key? key,
      required this.errorMessage,
      required this.tryAgainText,
      this.tryAgain})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            tr(errorMessage),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, color: textColor),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              tryAgain?.call();
            },
            child: Text(
              tr(tryAgainText),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, color: textColor),
            ),
          )
        ],
      ),
    );
  }
}
