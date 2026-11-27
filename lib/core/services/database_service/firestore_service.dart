import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_dash_board/core/errors/custom_exception.dart';
import 'package:ecommerce_dash_board/core/models/query_prams.dart';
import 'package:ecommerce_dash_board/core/services/database_service/database_service.dart';
import 'package:ecommerce_dash_board/generated/locale_keys.g.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DatabaseService)
class FirestoreService implements DatabaseService {
  final FirebaseFirestore _firestore;

  FirestoreService({required FirebaseFirestore firestore})
    : _firestore = firestore;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore.collection(path).add(data);
    } catch (e) {
      throw CustomException(
        exceptionMeassge: LocaleKeys.database_messages_addData.tr(),
      );
    }
  }

  @override
  Future<dynamic> getData({required String path}) async {
    try {
      var data = await _firestore.collection(path).get();
      return data.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      throw CustomException(
        exceptionMeassge: LocaleKeys.database_messages_getData.tr(),
      );
    }
  }

  @override
  Future<dynamic> getSingleData({
    required String path,
    required String documentId,
  }) async {
    try {
      var data = await _firestore.collection(path).doc(documentId).get();
      return data.data();
    } catch (e) {
      throw CustomException(
        exceptionMeassge: LocaleKeys.database_messages_getSingleData.tr(),
      );
    }
  }

  @override
  Future<void> addSingleData({
    required String path,
    required Map<String, dynamic> data,
    required String documentId,
  }) async {
    try {
      await _firestore.collection(path).doc(documentId).set(data);
    } catch (e) {
      throw CustomException(
        exceptionMeassge: LocaleKeys.database_messages_saveData.tr(),
      );
    }
  }

  @override
  Future<String> getDocumentId({
    required String path,
    required QueryParams query,
  }) async {
    try {
      Query<Map<String, dynamic>> data = _firestore.collection(path);

      final condition = query.condition;
      if (condition != null) {
        data = data.where(condition.field, isEqualTo: condition.isEqualTo);
      }

      if (condition != null) {
        data = data.where(condition.field, whereIn: condition.whereIn);
      }

      if (condition != null) {
        data = data.where(
          condition.field,
          arrayContains: condition.arrayContains,
        );
      }

      final order = query.order;
      if (order != null) {
        data = data.orderBy(order.field, descending: order.descending);
      }

      var result = await data.get();
      return result.docs.first.id;
    } catch (e) {
      throw CustomException(
        exceptionMeassge: LocaleKeys.database_messages_searchData.tr(),
      );
    }
  }

  @override
  Future<void> updateData({
    required String path,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore.collection(path).doc(documentId).update(data);
    } catch (e) {
      throw CustomException(
        exceptionMeassge: LocaleKeys.database_messages_updateData.tr(),
      );
    }
  }

  @override
  Stream<List<Map<String, dynamic>>> getStreamData({required String path}) {
    try {
      var result = _firestore.collection(path).snapshots();
      return result.map((snapShot) {
        return snapShot.docs.map((doc) => doc.data()).toList();
      });
    } catch (e) {
      throw CustomException(
        exceptionMeassge: LocaleKeys.database_messages_getData.tr(),
      );
    }
  }

  @override
  Stream<Map<String, dynamic>?> getSingleStreamDate({
    required String path,
    required String documentId,
  }) {
    try {
      var result = _firestore.collection(path).doc(documentId).snapshots();
      return result.map((snapShot) {
        return snapShot.data();
      });
    } catch (e) {
      throw CustomException(
        exceptionMeassge: LocaleKeys.database_messages_getData.tr(),
      );
    }
  }

  @override
  Future<dynamic> checkUserData({
    required String path,
    required String documentId,
  }) async {
    try {
      final doc = await _firestore.collection(path).doc(documentId).get();
      return doc.data();
    } on CustomException {
      throw CustomException(
        exceptionMeassge: LocaleKeys.database_messages_getData.tr(),
      );
    }
  }
}
