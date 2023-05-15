
import 'package:chat_astro/secret.dart';
import 'package:dart_openai/openai.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'core/services/impl/ads_service_impl.dart';
import 'core/services/impl/storage_service_impl.dart';
import 'feature/user_profile/binding.dart';
import 'shared/app_cache_service.dart';

class InjectionContainer {
  static Future<void> dependencies() async {
    OpenAI.apiKey = openAiApiKey;
    OpenAI.organization = openAiOrganizationKey;

    // logger for application
    Get.put(Logger(), permanent: true);

    // core app services
    Get.put(StorageServiceImpl(), permanent: true);
    Get.put(AdsServiceImpl(), permanent: true);
    Get.put(AppCacheService(), permanent: true);

    await UserProfileBinding.dependencies();
  }
}
