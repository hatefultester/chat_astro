import 'package:chat_astro/core/abstractions/exceptions.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../storage_service.dart';

class StorageServiceImpl extends GetxService implements StorageService {
  final Logger logger;

  StorageServiceImpl({required this.logger});

  @override
  Future<SharedPreferences> get instance => SharedPreferences.getInstance();

  @override
  Future<String> getString({required String key}) async {
    try {
      final prefs = await instance;
      final String stringValue = prefs.getString(key)!;
      logger.d('returning string value from storage $stringValue');
      return stringValue;
    } catch (e) {
      logger.e('exception caught during getting key $key: ${e.toString()}');
      throw DataNotFoundException();
    }
  }

  @override
  Future<void> storeString({required String key, required String value}) async {
    try {
      final prefs = await instance;
      await prefs.setString(key, value);
    } catch (e) {
      logger.e('exception caught during setting key $key: ${e.toString()}');
      throw InvalidDataException();
    }
  }
}
