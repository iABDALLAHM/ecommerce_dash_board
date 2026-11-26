import 'dart:developer';
import 'package:ecommerce_dash_board/core/errors/custom_exception.dart';
import 'package:ecommerce_dash_board/core/repositories/flutter_secure_storage_repository/secure_storage_repository.dart';
import 'package:ecommerce_dash_board/core/services/secure_storage_service/flutter_secure_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SecureStorageRepository)
class SecureStorageRepositoryImplementation implements SecureStorageRepository {
  final FlutterSecureService _flutterSecureService;

  SecureStorageRepositoryImplementation({
    required FlutterSecureService flutterSecureService,
  }) : _flutterSecureService = flutterSecureService;

  @override
  Future<void> clearAll() async {
    try {
      await _flutterSecureService.clearAll();
    } on CustomException catch (e) {
      log(
        "This Error Happend in SecureStorageRepositoryImplementation in clearAll method, the error is $e",
      );
    }
  }

  @override
  Future<void> deleteData({required String key}) async {
    try {
      await _flutterSecureService.deleteData(key: key);
    } on CustomException catch (e) {
      log(
        "This Error Happend in SecureStorageRepositoryImplementation in deleteData method, the error is $e",
      );
    }
  }

  @override
  Future<String> getData({required String key}) async {
    try {
      var data = await _flutterSecureService.getData(key: key);
      return data;
    } on CustomException catch (e) {
      log(
        "This Error Happend in SecureStorageRepositoryImplementation in getData method , the error is $e",
      );
      return "This Error Happend in SecureStorageRepositoryImplementation in getData method , the error is $e";
    }
  }

  @override
  Future<void> saveData({required String key, required String value}) async {
    try {
      await _flutterSecureService.saveData(key: key, value: value);
    } on CustomException catch (e) {
      log(
        "This Error Happend in SecureStorageRepositoryImplementation in saveData method, the error is $e",
      );
    }
  }
}
