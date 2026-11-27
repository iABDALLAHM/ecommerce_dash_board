import 'package:ecommerce_dash_board/core/errors/custom_exception.dart';
import 'package:ecommerce_dash_board/core/services/secure_storage_service/flutter_secure_service.dart';
import 'package:ecommerce_dash_board/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FlutterSecureService)
class FlutterSecureStorageService implements FlutterSecureService {
  final FlutterSecureStorage _storage;

  FlutterSecureStorageService({required FlutterSecureStorage storage})
    : _storage = storage;

  @override
  Future<void> clearAll() async {
    try {
      await _storage.deleteAll();
    } catch (e) {
      throw CustomException(
        exceptionMeassge: LocaleKeys.secureStorage_messages_deleteData.tr(),
      );
    }
  }

  @override
  Future<void> deleteData({required String key}) async {
    try {
      await _storage.delete(key: key);
    } catch (e) {
      throw CustomException(
        exceptionMeassge: LocaleKeys.secureStorage_messages_deleteData.tr(),
      );
    }
  }

  @override
  Future<String> getData({required String key}) async {
    try {
      return await _storage.read(key: key) ?? "";
    } catch (e) {
      throw CustomException(
        exceptionMeassge: LocaleKeys.secureStorage_messages_getData.tr(),
      );
    }
  }

  @override
  Future<void> saveData({required String key, required String value}) async {
    try {
      await _storage.write(key: key, value: value);
    } catch (e) {
      throw CustomException(
        exceptionMeassge: LocaleKeys.secureStorage_messages_saveData.tr(),
      );
    }
  }
}
