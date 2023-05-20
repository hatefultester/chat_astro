import 'package:chat_astro/feature/chat_detail/binding.dart';
import 'package:dart_openai/openai.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../core/services/impl/ads_service_impl.dart';
import '../core/services/impl/session_service_impl.dart';
import '../core/services/impl/storage_service_impl.dart';
import '../core/utils/context_wrapper.dart';
import '../core/utils/dialog_utils.dart';
import '../core/utils/open_ai_utils.dart';
import '../feature/user_creation/binding.dart';
import '../secret.dart';

class InjectionContainer {
  static Future<void> dependencies() async {
    OpenAI.apiKey = openAiApiKey;
    OpenAI.organization = openAiOrganizationKey;

    // logger for application
    Get.put(Logger(), permanent: true);

    // Get context wrapper for buildContext and overlay buildContext
    Get.put(ContextWrapper(), permanent: true);

    // Session service for storing session variables and checking session state
    Get.put(SessionServiceImpl(), permanent: true);

    // Storage service for managing storing locally
    Get.put(StorageServiceImpl(logger: Get.find()), permanent: true);

    // Service for handling Ad's
    Get.put(AdsServiceImpl(), permanent: true);

    // Util for OpenAiCommunication handling
    Get.lazyPut(() => OpenAiUtils(sessionServiceImpl: Get.find()));

    // Util for displaying custom dialogs
    Get.lazyPut(() => DialogUtils(contextWrapper: Get.find()));

    // Loading user creation binding dependencies
    await UserCreationBinding.dependencies();

    // Loading user chat binding dependencies
    await ChatDetailBinding.dependencies();
  }
}
