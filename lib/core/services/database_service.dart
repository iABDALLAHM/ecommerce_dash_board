import 'package:ecommerce_dash_board/core/models/query_prams.dart';

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

  Future<String> getDocumentId({
    required String path,
    required QueryParams query,
  });

  Future<void> updateData({
    required String path,
    required String documentId,
  required  Map<String, dynamic> data,
  });
}
