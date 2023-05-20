/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:chat_astro/core/services/impl/session_service_impl.dart';
import 'package:chat_astro/feature/chat_detail/data/sources/impl/chat_detail_local_data_source.dart';
import 'package:dartz/dartz.dart';

import 'package:chat_astro/feature/chat_detail/domain/entities/chat_data.dart';

import 'package:chat_astro/core/abstractions/failures.dart';
import 'package:logger/logger.dart';

import '../../sources/impl/chat_detail_remote_data_source_impl.dart';
import '../chat_detail_repository.dart';

class ChatDetailRepositoryImpl implements ChatDetailRepository {
  final Logger _logger;

  final ChatDetailLocalDataSourceImpl _localDataSource;
  final ChatDetailRemoteDataSourceImpl _remoteDataSource;

  ChatDetailRepositoryImpl({
    required Logger logger,
    required ChatDetailLocalDataSourceImpl localDataSource,
    required ChatDetailRemoteDataSourceImpl remoteDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource,
        _logger = logger;

  @override
  Future<Either<Failure, ChatData>> syncChatData() async {
    try {
      final userProfileData = await _localDataSource.getUserProfile();
      final ChatData data = ChatData.fromUserProfile(userProfileData);
      _logger.d(
          'succesfully returning chat data from user profile ${data.toString()}');
      return Right(data);
    } on Exception catch (e) {
      _logger.e('syncing failed with exception e: ${e.toString()}');
      return Left(InvalidDataFailure());
    }
  }
}