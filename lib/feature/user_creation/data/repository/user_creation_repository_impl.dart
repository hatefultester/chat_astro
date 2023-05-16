/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:chat_astro/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import '../../../../core/utils/context_wrapper.dart';
import '../../domain/entities/user_profile_data.dart';
import '../../domain/entities/user_profile_entity.dart';
import '../data_source/user_creation_remote_data_source_impl.dart';
import 'user_creation_repository.dart';

class UserCreationRepositoryImpl implements UserCreationRepository {
  final Logger logger;
  final UserCreationRemoteDataSourceImpl remoteDataSource;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  UserCreationRepositoryImpl(
      {required this.remoteDataSource, required this.logger});

  @override
  Future<Either<Failure, UserProfileData>> createUserProfileData(
      {required UserProfileEntity entity}) async {
    try {
      final openAiResponse = await remoteDataSource.getUserProfileResponse(userProfileEntity: entity);
      logger.d('open ai response finished: $openAiResponse');
      return Right(UserProfileData(userProfileEntity: entity, chatResponse: openAiResponse,
      ));
    } on Exception catch (e) {
      logger.e('Creating user profile failed, exception: ${e.toString()}');
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> validateUserDateOfBirthData(
      {required DateTime? data}) async {
    try {
      final String formattedData = formatter.format(data!);
      logger.d('formatted date of birth $formattedData');
      return Right(formattedData);
    } on Exception catch (e) {
      logger.e(e.toString());
      return Left(InvalidDataFailure());
    }
  }

  @override
  Future<Either<Failure, String>> validateUserPlaceOfBirthInput(
      {required String data}) async {
    if (data.length > 8) {
      logger.d('formatted place of birth $data');
      return Right(data);
    } else {
      logger.e('validating user place of birth input failed');
      return Left(InvalidDataFailure());
    }
  }

  @override
  Future<Either<Failure, TimeOfDay>> validateUserTimeOfBirthInput(
      {required TimeOfDay? data}) async {
    try {
      final TimeOfDay formattedData = data!;
      logger.d('time of birth ${formattedData.hour}:${formattedData.minute}');
      return Right(formattedData);
    } on Exception catch (e) {
      logger.e(e.toString());
      return Left(InvalidDataFailure());
    }
  }
}
