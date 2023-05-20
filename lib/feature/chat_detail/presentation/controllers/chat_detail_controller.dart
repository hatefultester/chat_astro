/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

abstract class ChatDetailController {
  Future<void> initializeChat();
  Future<void> handleUserMessage(String message);
  Future<void> handleTryAgainTapped();
  Future<void> handleAssistentMessageWritten();
  Future<void> handleAssistentMessageStarted();
}
