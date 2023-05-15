import 'package:chat_astro/feature/user_profile/domain/entities/user_profile_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/user_profile_data.dart';

abstract class UserProfileRepository {
  Future<Either<Failure, UserProfileData>> createUserProfileData({required UserProfileEntity entity});
  Future<Either<Failure, String>> validateUserPlaceOfBirthInput({required String data});
  Future<Either<Failure, String>> validateUserTimeOfBirthInput({required TimeOfDay? data});
  Future<Either<Failure, String>> validateUserDateOfBirthData({required DateTime? data});
}