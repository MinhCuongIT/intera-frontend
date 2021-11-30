abstract class LocalStorageService {
  Future<void> write({required String key, required String value});
  Future<String?> read({required String key});
  Future<Map<String, String>> readAll();
  Future<void> delete({required String key});
  Future<void> deleteAll();
}