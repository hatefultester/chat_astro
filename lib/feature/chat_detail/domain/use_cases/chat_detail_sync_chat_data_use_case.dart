/*
 * Copyright (c) 2023. Created by Matěj Grohmann, all rights reserved.
 */

import 'package:chat_astro/feature/chat_detail/data/repository/impl/chat_detail_repository_impl.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/abstractions/use_case.dart';
import '../../../../core/abstractions/failures.dart';
import '../entities/chat_data.dart';

class ChatDetailSyncChatDataUseCase
    extends UseCase<ChatDetailRepositoryImpl, ChatData, NoParams> {
  ChatDetailSyncChatDataUseCase(
      {required super.repository, required super.logger});

  @override
  Future<Either<Failure, ChatData>> call(NoParams params) async {
    logger.i('CHAT DETAIL USE CASE CALLED: ChatDetailSyncChatDataUseCase');
    return await repository.syncChatData();
  }
}
