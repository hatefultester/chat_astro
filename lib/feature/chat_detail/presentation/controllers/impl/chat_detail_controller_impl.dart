/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:logger/logger.dart';

import '../../../../../app/app_locale_keys.dart';
import '../../../../../core/abstractions/use_case.dart';
import '../../../../../core/utils/context_wrapper.dart';
import '../../../../../core/utils/dialog_utils.dart';
import '../../../domain/entities/chat_message.dart';
import 'chat_detail_controller_state.dart';
import 'package:get/get.dart';

import '../chat_detail_controller.dart';

class ChatDetailControllerImpl extends GetxController
    implements ChatDetailController {
  final Logger logger;
  final ChatDetailControllerState state;
  final ContextWrapper contextWrapper;
  final DialogUtils dialogUtils;

  ChatDetailControllerImpl({
    required this.logger,
    required this.state,
    required this.contextWrapper,
    required this.dialogUtils,
  });

  @override
  onInit() async {
    super.onInit();
    logger.d('CHAT CONTROLLER INIT');
    await initializeChat();
    state.stopLoading();
    logger.d('CHAT CONTROLLER INITIALIZED');
  }

  @override
  Future<void> handleUserMessage(String message) async {
    logger.d('CHAT CONTROLLER: handling user input');
    final validationResult = await state.validateMessage(message);

    if (validationResult.isLeft()) {
      dialogUtils.showWarning(tr(LocaleKey.CHAT_VALIDATION_WARNING));
      return;
    }

    state.messages.add(
      ChatMessage(message: message, owner: ChatMessageOwner.user),
    );
    _scrollTillEnd();
    state.toggleAssistantWriting();
    final result = await state.getChatData.call(state.getChatParams());

    result.fold((l) {
      logger.d('getting response from user data failed');
    }, (r) {
      logger.d('adding message to chat');
      state.messages.add(r);
    });
  }

  @override
  Future<void> initializeChat() async {
    logger.d('CHAT CONTROLLER: initalizing chat');
    final syncResponse = await state.syncChatData.call(NoParams());

    syncResponse.fold((l) {
      logger.d('CHAT CONTROLLER: initalizing failed');
      state.displayErrorMessage();
      state.stopLoading();
    }, (r) {
      logger.d('CHAT CONTROLLER: initializing was succesfull');
      state.messages.addAll(r.messages);
      state.assistantImagePath = r.assistantAvatarImagePath;
      state.userImagePath = r.userAvatarImagePath;
      state.stopLoading();
    });
  }

  @override
  Future<void> handleTryAgainTapped() async {
    logger.d('CHAT CONTROLLER: handeling try again');
    state.dismissErrorMessage();
    state.startLoading();
    await initializeChat();
  }

  @override
  Future<void> handleAssistentMessageWritten() async {
    logger.d('CHAT CONTROLLER: callback for assistent message written called');
    if (state.messages.length == 1) {
      logger.d('CHAT CONTROLLER: it is first message, so addd init message');
      await Future.delayed(const Duration(milliseconds: 500));
      state.messages.add(
        ChatMessage(
            message: tr(LocaleKey.CHAT_INITIAL_ASSISTANT_CHAT_MESSAGE),
            owner: ChatMessageOwner.assistant),
      );
      _scrollTillEnd();
    } else {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        logger.d('CHAT CONTROLLER: handle stop assistant writing');
        _scrollTillEnd();

        state.stopAssistantWriting();
      });
    }
  }

  @override
  Future<void> handleAssistentMessageStarted() async {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      logger.d('CHAT CONTROLLER: handle assistant start writing');
      state.toggleAssistantWriting();
    });
  }

  _scrollTillEnd() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      state.scrollController.animateTo(
        state.scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }
}
