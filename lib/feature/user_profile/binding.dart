import 'package:chat_astro/feature/user_profile/data/data_source/impl/user_profile_remote_data_source_impl.dart';
import 'package:chat_astro/feature/user_profile/data/repository/impl/user_profile_repository_impl.dart';
import 'package:chat_astro/feature/user_profile/domain/use_cases/create_user_profile_data_use_case.dart';
import 'package:chat_astro/feature/user_profile/domain/use_cases/validate_user_date_of_birth_use_case.dart';
import 'package:chat_astro/feature/user_profile/domain/use_cases/validate_user_place_of_birth_use_case.dart';
import 'package:chat_astro/feature/user_profile/domain/use_cases/validate_user_time_of_birth_use_case.dart';
import 'package:get/get.dart';

class UserProfileBinding {
  static Future<void> dependencies() async {
    Get.put(UserProfileRemoteDataSourceImpl(), permanent: true);

    Get.lazyPut(
            () => UserProfileRepositoryImpl(remoteDataSource: Get.find(), logger: Get.find()),
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
