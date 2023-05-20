/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:dartz/dartz.dart';

import '../../../../core/abstractions/failures.dart';
import '../../domain/entities/chat_data.dart';

abstract class ChatDetailRepository {
  Future<Either<Failure, ChatData>> syncChatData();
}
