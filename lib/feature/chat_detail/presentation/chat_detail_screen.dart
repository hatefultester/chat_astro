/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */
import 'package:easy_localization/easy_localization.dart';

import 'sections/chat_detail_messages_section.dart';
import 'sections/chat_detail_text_input_section.dart';
import 'widgets/chat_detail_error_widget.dart';
import '../../../app/app_locale_keys.dart';
import 'controllers/impl/chat_detail_controller_impl.dart';
import 'controllers/impl/chat_detail_controller_state.dart';
import 'widgets/chat_detail_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatDetailControllerImpl>(
      init: _initController(),
      builder: (ChatDetailControllerImpl controller) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
            title: Text(
              tr(LocaleKey.CHAT_TITLE),
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.black,
          body: Obx(
            () {
              // handle loading state of page when loading is presented
              if (controller.state.isLoading.value) {
                return const Center(
                  child: ChatDetailLoadingWidget(
                    text: LocaleKey.CHAT_LOADING,
                  ),
                );
              }

              // handle Error state
              if (controller.state.displayError.value) {
                return Center(
                  child: ChatDetailErrorWidget(
                    tryAgainText: LocaleKey.CHAT_TRY_AGAIN,
                    errorMessage: LocaleKey.CHAT_ERROR_MESSAGE,
                    tryAgain: () {
                      controller.handleTryAgainTapped();
                    },
                  ),
                );
              }

              return SafeArea(
                child: Column(
                  children: [
                    const Expanded(
                      flex: 4,
                      child: ChatDetailChatMessagesSection(),
                    ),
                    Expanded(
                      flex: 1,
                      child: ChatDetailTextInputSection(
                        controller: controller,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  ChatDetailControllerImpl _initController() => ChatDetailControllerImpl(
        logger: Get.find(),
        state: ChatDetailControllerState(
          validateMessage: Get.find(),
          getChatData: Get.find(),
          syncChatData: Get.find(),
        ),
        contextWrapper: Get.find(),
        dialogUtils: Get.find(),
      );
}
