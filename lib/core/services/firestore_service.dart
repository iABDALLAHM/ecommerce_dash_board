import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_dash_board/core/errors/custom_exception.dart';
import 'package:ecommerce_dash_board/core/services/database_service.dart';

class FirestoreService implements DatabaseService {
  final FirebaseFirestore firestore;

  FirestoreService({required this.firestore});

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    try {
      await firestore.collection(path).add(data);
    } catch (e) {
      throw CustomException(
        exceptionMeassge: "حدث خطأ أثناء إضافة البيانات إلى قاعدة البيانات",
      );
    }
  }

  @override
  Future<dynamic> getData({required String path}) async {
    try {
      var data = await firestore.collection(path).get();
      return data.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      throw CustomException(
        exceptionMeassge: "حدث خطأ أثناء جلب البيانات من قاعدة البيانات",
      );
    }
  }

  @override
  Future<dynamic> getSingleData({
    required String path,
    required String documentId,
  }) async {
    try {
      var data = await firestore.collection(path).doc(documentId).get();
      return data.data();
    } catch (e) {
      throw CustomException(
        exceptionMeassge: "حدث خطأ أثناء جلب عنصر محدد من قاعدة البيانات",
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
      await firestore.collection(path).doc(documentId).set(data);
    } catch (e) {
      throw CustomException(
        exceptionMeassge: "حدث خطأ أثناء حفظ البيانات في المستند",
      );
    }
  }
}
