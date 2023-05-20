/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import '../../../../../core/abstractions/use_case.dart';
import '../../../../../core/utils/context_wrapper.dart';
import '../../../../../core/utils/dialog_utils.dart';
import 'chat_detail_controller_state.dart';
import 'package:get/get.dart';

import '../chat_detail_controller.dart';

class ChatDetailControllerImpl extends GetxController
    implements ChatDetailController {
  final ChatDetailControllerState state;
  final ContextWrapper contextWrapper;
  final DialogUtils dialogUtils;

  ChatDetailControllerImpl({
    required this.state,
    required this.contextWrapper,
    required this.dialogUtils,
  });

  @override
  onInit() async {
    super.onInit();
    await initializeChat();
    state.stopLoading();
  }

  @override
  Future<void> handleUserMessage(String message) async {}

  @override
  Future<void> initializeChat() async {
    final syncResponse = await state.syncChatData.call(NoParams());

    syncResponse.fold((l) {
      state.displayErrorMessage();
      state.stopLoading();
    }, (r) {
      state.initialChatMessage.value = r.initialChatMessage;
      state.assistantImagePath = r.assistantAvatarImagePath;
      state.userImagePath = r.userAvatarImagePath;
      state.stopLoading();
    });
  }

  @override
  Future<void> handleTryAgainTapped() async {
    state.dismissErrorMessage();
    state.startLoading();
    await initializeChat();
  }
}
