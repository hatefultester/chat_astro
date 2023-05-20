/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import '../../domain/entities/chat_message.dart';

abstract class ChatDetailRemoteDataSource {
  Future<String> getChatResponse({required List<ChatMessage> messages});
}
