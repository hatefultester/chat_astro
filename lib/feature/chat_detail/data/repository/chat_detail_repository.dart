/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:dartz/dartz.dart';

import '../../../../core/abstractions/failures.dart';
import '../../domain/entities/chat_data.dart';
import '../../domain/entities/chat_message.dart';

abstract class ChatDetailRepository {
  Future<Either<Failure, ChatData>> syncChatData();
  Future<Either<Failure, ChatMessage>> getAssistantResponse(
      {required List<ChatMessage> chat, required String userAvatar});
  Future<Either<Failure, bool>> validateUserMessage(String message);
}
