/*
 * Copyright (c) 2023. Created by Matěj Grohmann, all rights reserved.
 */

import 'package:chat_astro/feature/chat_detail/data/repository/impl/chat_detail_repository_impl.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/abstractions/use_case.dart';
import '../../../../core/abstractions/failures.dart';
import '../entities/chat_data.dart';
import '../entities/chat_message.dart';

class ChatDetailGetAssistantResponseUseCase extends UseCase<
    ChatDetailRepositoryImpl,
    ChatMessage,
    ChatDetailGetAssistantResponseUseCaseParams> {
  ChatDetailGetAssistantResponseUseCase(
      {required super.repository, required super.logger});

  @override
  Future<Either<Failure, ChatMessage>> call(
      ChatDetailGetAssistantResponseUseCaseParams params) async {
    logger.i(
        'CHAT DETAIL USE CASE CALLED: ChatDetailGetAssistantResponseUseCase');
    return await repository.getAssistantResponse(
        chat: params.messages, userAvatar: params.userPath);
  }
}

class ChatDetailGetAssistantResponseUseCaseParams {
  final List<ChatMessage> messages;
  final String userPath;

  ChatDetailGetAssistantResponseUseCaseParams({
    required this.messages,
    required this.userPath,
  });
}
