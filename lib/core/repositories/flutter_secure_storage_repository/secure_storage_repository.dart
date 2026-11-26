abstract class SecureStorageRepository {
  Future<void> saveData({required String key, required String value});

  Future<String> getData({required String key});

  Future<void> deleteData({required String key});

  Future<void> clearAll();
}
