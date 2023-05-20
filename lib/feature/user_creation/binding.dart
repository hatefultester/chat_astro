import 'package:get/get.dart';

import 'data/sources/user_creation_local_data_source_impl.dart';
import 'data/sources/user_creation_remote_data_source_impl.dart';
import 'data/repository/user_creation_repository_impl.dart';
import 'domain/use_cases/create_user_profile_data_use_case.dart';
import 'domain/use_cases/store_user_data_to_session_use_case.dart';
import 'domain/use_cases/validate_user_date_of_birth_use_case.dart';
import 'domain/use_cases/validate_user_place_of_birth_use_case.dart';
import 'domain/use_cases/validate_user_time_of_birth_use_case.dart';

class UserCreationBinding {
  static Future<void> dependencies() async {
    Get.put(
        UserCreationLocalDataSourceImpl(
          sessionServiceImpl: Get.find(),
        ),
        permanent: true);
    Get.put(
        UserCreationRemoteDataSourceImpl(
          logger: Get.find(),
          openAiUtils: Get.find(),
        ),
        permanent: true);

    Get.lazyPut(
      () => UserCreationRepositoryImpl(
        remoteDataSource: Get.find(),
        logger: Get.find(),
        localDataSource: Get.find(),
      ),
    );

    Get.lazyPut(
      () => CreateUserProfileDataUseCase(
        repository: Get.find(),
        logger: Get.find(),
      ),
    );

    Get.lazyPut(
      () => ValidateUserDateOfBirthUseCase(
        repository: Get.find(),
        logger: Get.find(),
      ),
    );

    Get.lazyPut(
      () => ValidateUserPlaceOfBirthUseCase(
        repository: Get.find(),
        logger: Get.find(),
      ),
    );

    Get.lazyPut(
      () => ValidateUserTimeOfBirthUseCase(
        repository: Get.find(),
        logger: Get.find(),
      ),
    );

    Get.lazyPut(
      () => StoreUserDataToSessionUseCase(
        repository: Get.find(),
        logger: Get.find(),
      ),
    );
  }
}
