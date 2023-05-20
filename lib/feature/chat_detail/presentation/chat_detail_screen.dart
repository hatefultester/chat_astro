/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:chat_astro/feature/chat_detail/presentation/sections/chat_detail_initial_message_section.dart';
import 'package:chat_astro/feature/chat_detail/presentation/sections/chat_detail_messages_section.dart';
import 'package:chat_astro/feature/chat_detail/presentation/sections/chat_detail_text_input_section.dart';
import 'package:chat_astro/feature/chat_detail/presentation/widgets/chat_detail_error_widget.dart';
import 'package:easy_localization/easy_localization.dart';

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
          // appBar: AppBar(
          //   title: Text(
          //     tr(LocaleKey.CHAT_TITLE),
          //   ),
          // ),
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

              // handle loaded state
              return SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ChatDetailInitialMessageSection(
                          initialMessage: controller.state.initialChatMessage),
                    ),
                    const Expanded(
                      flex: 4,
                      child: ChatDetailChatMessagesSection(),
                    ),
                    const Expanded(
                      flex: 1,
                      child: ChatDetailTextInputSection(),
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
        state: ChatDetailControllerState(
          syncChatData: Get.find(),
        ),
        contextWrapper: Get.find(),
        dialogUtils: Get.find(),
      );
}
