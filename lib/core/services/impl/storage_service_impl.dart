import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../storage_service.dart';

class StorageServiceImpl extends GetxService implements StorageService {

  @override
  Future<String?> getString({required String key}) async {
    final prefs = await instance;
    return prefs.getString(key);
  }

  @override
  Future<SharedPreferences> get instance => SharedPreferences.getInstance();

  @override
  Future<void> storeString({required String key, required String value}) async {
    final prefs = await instance;
    await prefs.setString(key, value);
  }
}
