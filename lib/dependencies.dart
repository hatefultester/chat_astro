import 'package:dart_openai/openai.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'core/services/impl/ads_service_impl.dart';
import 'core/services/impl/cache_service_impl.dart';
import 'core/services/impl/storage_service_impl.dart';
import 'core/utils/context_wrapper.dart';
import 'core/utils/dialog_utils.dart';
import 'core/utils/open_ai_utils.dart';
import 'feature/user_creation/binding.dart';
import 'secret.dart';

class InjectionContainer {
  static Future<void> dependencies() async {
    OpenAI.apiKey = openAiApiKey;
    OpenAI.organization = openAiOrganizationKey;

    // logger for application
    Get.put(Logger(), permanent: true);
    Get.put(ContextWrapper(), permanent: true);

    // core app services
    Get.put(StorageServiceImpl(), permanent: true);
    Get.put(AdsServiceImpl(), permanent: true);
    Get.put(CacheServiceImpl(), permanent: true);

    Get.lazyPut(() => OpenAiUtils());
    Get.lazyPut(() => DialogUtils(contextWrapper: Get.find()));

    await UserCreationBinding.dependencies();
  }
}
