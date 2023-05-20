import 'package:chat_astro/app/app_locale_keys.dart';
import 'package:chat_astro/feature/chat_detail/presentation/controllers/impl/chat_detail_controller_impl.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ChatDetailTextInputSection extends StatefulWidget {
  const ChatDetailTextInputSection({Key? key, required this.controller})
      : super(key: key);

  final ChatDetailControllerImpl controller;

  @override
  ChatDetailTextInputSectionState createState() =>
      ChatDetailTextInputSectionState();
}

class ChatDetailTextInputSectionState
    extends State<ChatDetailTextInputSection> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
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
      height: 70.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              maxLines: 20,
              minLines: 5,
              controller: _controller,
              decoration: InputDecoration(
                hintText: tr(LocaleKey.CHAT_HINT_MESSAGE),
                hintStyle: const TextStyle(color: Colors.black54),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: 15.0),
          Obx(
            () {
              return FloatingActionButton(
                  onPressed: () {
                    if (!widget.controller.state.assistantWriting.value) {
                      // Handle message submission here
                      widget.controller
                          .handleUserMessage(_controller.value.text);
                      _controller.clear();

                      // Close the keyboard
                      FocusScope.of(context).unfocus();
                    }
                  },
                  backgroundColor: widget.controller.state.assistantWriting.value ? Colors.blue.withOpacity(0.8) : Colors.blue,
                  elevation: 0,
                  child: widget.controller.state.assistantWriting.value
                      ? LoadingAnimationWidget.prograssiveDots(
                          color: Colors.white, size: 20)
                      : const Icon(Icons.send, color: Colors.white, size: 18.0));
            },
          ),
        ],
      ),
    );
  }
}
