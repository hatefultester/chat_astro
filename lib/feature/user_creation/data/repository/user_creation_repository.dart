/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/abstractions/failures.dart';
import '../../domain/entities/user_profile_data.dart';
import '../../domain/entities/user_profile_entity.dart';

abstract class UserCreationRepository {
  Future<Either<Failure, UserProfileData>> createUserProfileData(
      {required UserProfileEntity entity});
  Future<Either<Failure, String>> validateUserDateOfBirthData(
      {required DateTime? data});
  Future<Either<Failure, String>> validateUserPlaceOfBirthInput(
      {required String data});
  Future<Either<Failure, TimeOfDay>> validateUserTimeOfBirthInput(
      {required TimeOfDay? data});
}
