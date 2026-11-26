import 'dart:developer';
import 'package:ecommerce_dash_board/core/errors/custom_exception.dart';
import 'package:ecommerce_dash_board/features/auth/data/services/auth_service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthService)
class FirebaseAuthService implements AuthService {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthService({required this.firebaseAuth});

  @override
  Future<User> signIn({required String email, required String password}) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        "error happend in FirebaseAuthService in signIn method please check it, the error: $e",
      );
      if (e.code == 'user-not-found') {
        throw CustomException(
          exceptionMeassge: "هذا المستخدم غير موجود بالفعل",
        );
      } else if (e.code == 'wrong-password') {
        throw CustomException(exceptionMeassge: "الباسورد غير صحيح");
      } else if (e.code == "network-request-failed") {
        throw CustomException(exceptionMeassge: "افحص الشبكة الانترنت");
      } else if (e.code == "invalid-credential") {
        throw CustomException(
          exceptionMeassge: "البريد الإلكتروني أو كلمة المرور غير صحيحة",
        );
      } else {
        throw CustomException(
          exceptionMeassge: "حدث خطأ اعد المحاولة مرة اخرى",
        );
      }
    } catch (e) {
      log(
        "error happend in FirebaseAuthService in signIn method please check it, the error: $e",
      );
      throw CustomException(exceptionMeassge: "حدث خطأ اعد المحاولة مرة اخرى");
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      log(
        "error happend in FirebaseAuthService in signOut method please check it, the error: $e",
      );
      throw CustomException(
        exceptionMeassge: " LocaleKeys.authErrors_generalError.tr(),",
      );
    }
  }

  @override
  Future<String>? getCurrentUserId() async {
    try {
      var userId = firebaseAuth.currentUser;

      if (userId == null) {
        throw CustomException(
          exceptionMeassge: "حدث خطأ اعد المحاولة مرة اخرى",
        );
      }
      return userId.uid;
    } on FirebaseAuthException catch (e) {
      log(
        "error happend in FirebaseAuthService in getCurrentUserId method please check it, the error: $e",
      );
      throw CustomException(exceptionMeassge: "حدث خطأ اعد المحاولة مرة اخرى");
    }
  }
}
