/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:chat_astro/feature/user_creation/data/data_source/user_creation_remote_data_source_impl.dart';
import 'package:chat_astro/feature/user_creation/data/repository/user_creation_repository_impl.dart';
import 'package:chat_astro/feature/user_creation/domain/entities/user_profile_data.dart';
import 'package:chat_astro/feature/user_creation/domain/entities/user_profile_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:chat_astro/core/abstractions/failures.dart';
import 'package:logger/logger.dart';

import 'user_creation_repository_test.mocks.dart';

@GenerateMocks([UserCreationRemoteDataSourceImpl])
void main() {
  late MockUserCreationRemoteDataSourceImpl mockRemoteDataSource;
  late Logger mockLogger;
  late UserCreationRepositoryImpl repository;

  setUp(() {
    mockRemoteDataSource = MockUserCreationRemoteDataSourceImpl();
    mockLogger = Logger();
    repository = UserCreationRepositoryImpl(remoteDataSource: mockRemoteDataSource, logger: mockLogger);
  });

  group('UserCreationRepositoryImpl', () {
    final tDateTime = DateTime.now();
    const tPlaceOfBirth = "Venice in italy";
    const tTimeOfBirth = TimeOfDay(hour: 10, minute: 30);
    final tUserProfileEntity = UserProfileEntity(birthDate: tDateTime.toString(), birthPlace: tPlaceOfBirth, birthTime: tTimeOfBirth.toString(), userLanguage: 'en');
    final tUserProfileData = UserProfileData(userProfileEntity: tUserProfileEntity, chatResponse: 'Test response');

    test(
      'should return UserProfileData when createUserProfileData is called',
          () async {
        // arrange
        when(mockRemoteDataSource.getUserProfileResponse(userProfileEntity: tUserProfileEntity))
            .thenAnswer((_) async => 'Test response');
        // act
        final result = await repository.createUserProfileData(entity: tUserProfileEntity);
        // assert
        expect(result, Right(tUserProfileData));
        verify(mockRemoteDataSource.getUserProfileResponse(userProfileEntity: tUserProfileEntity));
        verifyNoMoreInteractions(mockRemoteDataSource);
      },
    );

    test(
      'should return formatted string when validateUserDateOfBirthData is called',
          () async {
        // act
        final result = await repository.validateUserDateOfBirthData(data: tDateTime);
        // assert
        expect(result, Right(DateFormat('yyyy-MM-dd').format(tDateTime)));
      },
    );

    test(
      'should return input string when validateUserPlaceOfBirthInput is called with string longer than 8 characters',
          () async {
        // act
        final result = await repository.validateUserPlaceOfBirthInput(data: tPlaceOfBirth);
        // assert
        expect(result, const Right(tPlaceOfBirth));
      },
    );

    test(
      'should return InvalidDataFailure when validateUserPlaceOfBirthInput is called with string shorter than 8 characters',
          () async {
        // act
        final result = await repository.validateUserPlaceOfBirthInput(data: 'Short');
        // assert
        expect(result.fold((l) => l, (r) => r), isA<InvalidDataFailure>());
      },
    );

    test(
      'should return TimeOfDay when validateUserTimeOfBirthInput is called',
          () async {
        // act
        final result = await repository.validateUserTimeOfBirthInput(data: tTimeOfBirth);
        // assert
        expect(result, const Right(tTimeOfBirth));
      },
    );
  });
}
