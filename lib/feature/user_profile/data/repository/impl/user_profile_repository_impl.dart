import 'package:chat_astro/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import '../../../domain/entities/user_profile_data.dart';
import '../../../domain/entities/user_profile_entity.dart';
import '../../data_source/impl/user_profile_remote_data_source_impl.dart';
import '../user_profile_repository.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  final Logger logger;
  final UserProfileRemoteDataSourceImpl remoteDataSource;

  UserProfileRepositoryImpl(
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
      logger.e(e.toString());
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> validateUserDateOfBirthData(
      {required DateTime? data}) async {
    try {
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
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
      return Right(data);
    } else {
      return Left(InvalidDataFailure());
    }
  }

  @override
  Future<Either<Failure, String>> validateUserTimeOfBirthInput(
      {required TimeOfDay? data}) async {
    try {
      final String formattedData = data!.format(Get.context!).toString();
      logger.d('formatted time of birth $formattedData');
      return Right(formattedData);
    } on Exception catch (e) {
      logger.e(e.toString());
      return Left(InvalidDataFailure());
    }
  }
}
