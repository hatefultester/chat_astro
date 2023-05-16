import 'data/data_source/user_creation_remote_data_source_impl.dart';
import 'data/repository/user_creation_repository_impl.dart';
import 'domain/use_cases/create_user_profile_data_use_case.dart';
import 'domain/use_cases/validate_user_date_of_birth_use_case.dart';
import 'domain/use_cases/validate_user_place_of_birth_use_case.dart';
import 'domain/use_cases/validate_user_time_of_birth_use_case.dart';
import 'package:get/get.dart';

class UserCreationBinding {
  static Future<void> dependencies() async {
    Get.put(UserCreationRemoteDataSourceImpl(), permanent: true);

    Get.lazyPut(
            () => UserCreationRepositoryImpl(remoteDataSource: Get.find(), logger: Get.find()),
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
  }
}
