import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageService {
  Future<SharedPreferences> get instance;
  Future<String?> getString({required String key});
  Future<void> storeString({required String key, required String value});
}