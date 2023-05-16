/*
 * Copyright (c) 2023. File was created by Matěj Grohmann, all rights reserved.
 */

import 'package:chat_astro/feature/user_creation/data/data_source/user_creation_remote_data_source_impl.dart';
import 'package:chat_astro/feature/user_creation/data/repository/user_creation_repository_impl.dart';
import 'package:chat_astro/feature/user_creation/domain/entities/user_profile_data.dart';
import 'package:chat_astro/feature/user_creation/domain/use_cases/create_user_profile_data_use_case.dart';
import 'package:chat_astro/feature/user_creation/domain/use_cases/validate_user_date_of_birth_use_case.dart';
import 'package:chat_astro/feature/user_creation/domain/use_cases/validate_user_place_of_birth_use_case.dart';
import 'package:chat_astro/feature/user_creation/domain/use_cases/validate_user_time_of_birth_use_case.dart';
import 'package:chat_astro/feature/user_creation/presentation/controllers/impl/user_creation_controller_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:chat_astro/feature/user_creation/presentation/controllers/impl/user_creation_controller_impl.dart';
import 'package:chat_astro/core/utils/context_wrapper.dart';
import 'package:chat_astro/core/utils/dialog_utils.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_creation_controller_test.mocks.dart';

class FakeUserCreationController extends UserCreationControllerImpl {
  int navigateToDetailScreenCalls = 0;
  int storeUserProfileDataToCacheCalls = 0;

  FakeUserCreationController({
    required UserCreationControllerState state,
    required DialogUtils dialogUtils,
    required ContextWrapper contextWrapper
  }) : super(state: state, dialogUtils: dialogUtils, contextWrapper: contextWrapper);

  @override
  String formatLocalizedTimeOfDay(TimeOfDay timeOfDay) {
    return timeOfDay.toString();
  }

  @override
  String getUserLanguage() {
    return 'EN';
  }


  @override
  void navigateToDetailScreen() {
    navigateToDetailScreenCalls += 1;
  }

  @override
  void storeUserProfileDataToCache() {
    storeUserProfileDataToCacheCalls += 1;
  }
}


@GenerateMocks([UserCreationRemoteDataSourceImpl, ContextWrapper, DialogUtils])
void main() {
  late FakeUserCreationController controller;
  late MockDialogUtils mockDialogUtils;
  late MockContextWrapper mockContextWrapper;

  late MockUserCreationRemoteDataSourceImpl mockRemoteDataSource;
  late Logger mockLogger;
  late UserCreationRepositoryImpl repository;

  setUp(() {
    mockRemoteDataSource = MockUserCreationRemoteDataSourceImpl();
    mockLogger = Logger();
    repository = UserCreationRepositoryImpl(
        remoteDataSource: mockRemoteDataSource, logger: mockLogger);
    mockDialogUtils = MockDialogUtils();
    mockContextWrapper = MockContextWrapper();
    controller = FakeUserCreationController(
        state: UserCreationControllerState(
          createProfile: CreateUserProfileDataUseCase(
              repository: repository, logger: mockLogger),
          validateTime: ValidateUserTimeOfBirthUseCase(
              repository: repository, logger: mockLogger),
          validateDate: ValidateUserDateOfBirthUseCase(
              repository: repository, logger: mockLogger),
          validatePlace: ValidateUserPlaceOfBirthUseCase(
            repository: repository,
            logger: mockLogger,
          ),
        ),
        dialogUtils: mockDialogUtils,
        contextWrapper: mockContextWrapper,);
  });

  group('user creation controller tests', () {
    test('handle select birth date', () async {
      DateTime mockDate = DateTime.now();

      when(mockDialogUtils.showCustomDatePicker())
          .thenAnswer((_) async => mockDate);

      await controller.handleSelectBirthDate();

      expect(controller.state.dateOfBirthTextEditingController.value.text,
          repository.formatter.format(mockDate));
      expect(controller.state.isDateOfBirthValid.value, true);
    });

    test('handle select birth time', () async {
      TimeOfDay mockTime = const TimeOfDay(hour: 10, minute: 30);

      when(mockDialogUtils.showCustomTimePicker())
          .thenAnswer((_) async => mockTime);

      await controller.handleSelectBirthTime();

      expect(controller.state.timeOfBirthTextEditingController.value.text,
          mockTime.toString());
      expect(controller.state.isTimeOfBirthValid.value, true);
    });

    test('handle birth place changed', () async {
      const String mockPlace = 'Test Place';

      controller.state.placeOfBirthTextEditingController.text = mockPlace;
      await controller.handleBirthPlaceChanged();

      expect(controller.state.isPlaceOfBirthValid.value, true);
    });

    test('handle submit button tapped', () async {
      DateTime mockDate = DateTime.now();
      TimeOfDay mockTime = const TimeOfDay(hour: 10, minute: 30);
      const String mockPlace = 'Test Place';

      controller.state.dateOfBirthTextEditingController.text =
          repository.formatter.format(mockDate);
      controller.state.timeOfBirthTextEditingController.text =
          controller.formatLocalizedTimeOfDay(mockTime);
      controller.state.placeOfBirthTextEditingController.text = mockPlace;
      controller.state.isDateOfBirthValid.value = true;
      controller.state.isTimeOfBirthValid.value = true;
      controller.state.isPlaceOfBirthValid.value = true;

      when(mockRemoteDataSource.getUserProfileResponse(
              userProfileEntity: controller.parseUserProfileEntity()))
          .thenAnswer((_) async => 'Test response');

      await controller.handleSubmitButtonTapped();
      expect(controller.navigateToDetailScreenCalls, 1);
      expect(controller.storeUserProfileDataToCacheCalls, 1);
      expect(controller.state.wasSubmitButtonTapped, true);
      expect(controller.state.isWarningPresent.value, false);
    });
  });
}
