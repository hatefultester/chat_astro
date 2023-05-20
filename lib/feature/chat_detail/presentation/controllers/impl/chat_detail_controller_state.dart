/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:get/get.dart';

import '../../../domain/use_cases/chat_detail_sync_chat_data_use_case.dart';

class ChatDetailControllerState {
  final ChatDetailSyncChatDataUseCase syncChatData;

  ChatDetailControllerState({
    required this.syncChatData,
  });

  RxBool isLoading = true.obs;
  RxBool displayError = false.obs;

  RxString initialChatMessage = ''.obs;

  startLoading() => isLoading.value = true;
  stopLoading() => isLoading.value = false;
  displayErrorMessage() => displayError.value = true;
  dismissErrorMessage() => displayError.value = false;
}
