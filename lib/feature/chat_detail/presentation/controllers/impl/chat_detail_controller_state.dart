/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:chat_astro/feature/chat_detail/domain/use_cases/chat_detail_get_assistant_response_use_case.dart';
import 'package:chat_astro/feature/chat_detail/domain/use_cases/chat_detail_validate_user_message_use_case.dart';
import 'package:get/get.dart';

import '../../../domain/entities/chat_message.dart';
import '../../../domain/use_cases/chat_detail_sync_chat_data_use_case.dart';

class ChatDetailControllerState {
  final ChatDetailSyncChatDataUseCase syncChatData;
  final ChatDetailGetAssistantResponseUseCase getChatData;
  final ChatDetailValidateUserMessageUseCase validateMessage;

  ChatDetailControllerState({
    required this.syncChatData,
    required this.getChatData,
    required this.validateMessage,
  });

  RxList<ChatMessage> messages = RxList();

  RxBool isLoading = true.obs;
  RxBool displayError = false.obs;

  RxBool assistantWriting = true.obs;

  late String assistantImagePath;
  late String userImagePath;

  startLoading() => isLoading.value = true;
  stopLoading() => isLoading.value = false;
  displayErrorMessage() => displayError.value = true;
  dismissErrorMessage() => displayError.value = false;

  toggleAssistantWriting() => assistantWriting.value = true;
  stopAssistantWriting() => assistantWriting.value = false;

  ChatDetailGetAssistantResponseUseCaseParams getChatParams() {
    return ChatDetailGetAssistantResponseUseCaseParams(
        messages: messages, userPath: userImagePath);
  }
}
