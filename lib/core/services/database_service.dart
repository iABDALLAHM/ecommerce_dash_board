abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  });

  Future<void> addSingleData({
    required String path,
    required Map<String, dynamic> data,
    required String documentId,
  });

  Future<dynamic> getData({required String path});

  Future<dynamic> getSingleData({
    required String path,
    required String documentId,
  });
}
