import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import 'local_storage_service.dart';

class SecureLocalStorageService extends GetxService implements LocalStorageService {
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  @override
  Future<void> delete({required String key}) async => await _secureStorage.delete(key: key);

  @override
  Future<void> deleteAll() async => await _secureStorage.deleteAll();

  @override
  Future<String?> read({required String key}) async => await _secureStorage.read(key: key);

  @override
  Future<Map<String, String>> readAll() async => await _secureStorage.readAll();

  @override
  Future<void> write({required String key, required String value}) async => await _secureStorage.write(key: key, value: value);
}
