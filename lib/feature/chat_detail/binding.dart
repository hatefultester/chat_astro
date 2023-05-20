import 'package:chat_astro/feature/chat_detail/data/repository/impl/chat_detail_repository_impl.dart';
import 'package:get/get.dart';

import 'data/sources/impl/chat_detail_local_data_source.dart';
import 'data/sources/impl/chat_detail_remote_data_source_impl.dart';
import 'domain/use_cases/chat_detail_sync_chat_data_use_case.dart';

class ChatDetailBinding {
  static Future<void> dependencies() async {
    Get.put(
        ChatDetailLocalDataSourceImpl(
          logger: Get.find(),
          sessionServiceImpl: Get.find(),
        ),
        permanent: true);
    Get.put(
        ChatDetailRemoteDataSourceImpl(
          logger: Get.find(),
          openAiUtils: Get.find(),
        ),
        permanent: true);
    Get.put(
        ChatDetailRepositoryImpl(
          logger: Get.find(),
          localDataSource: Get.find(),
          remoteDataSource: Get.find(),
        ),
        permanent: true);
    Get.lazyPut(() => ChatDetailSyncChatDataUseCase(
          logger: Get.find(),
          repository: Get.find(),
        ));
  }
}
