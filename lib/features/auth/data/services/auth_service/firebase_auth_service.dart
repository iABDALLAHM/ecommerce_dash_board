import 'dart:developer';
import 'package:ecommerce_dash_board/core/errors/custom_exception.dart';
import 'package:ecommerce_dash_board/features/auth/data/services/auth_service/auth_service.dart';
import 'package:ecommerce_dash_board/generated/locale_keys.g.dart';
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
          exceptionMeassge: LocaleKeys.login_messages_userNotFound,
        );
      } else if (e.code == 'wrong-password') {
        throw CustomException(
          exceptionMeassge: LocaleKeys.login_messages_wrongPassword,
        );
      } else if (e.code == "network-request-failed") {
        throw CustomException(
          exceptionMeassge: LocaleKeys.login_messages_networkError,
        );
      } else if (e.code == "invalid-credential") {
        throw CustomException(
          exceptionMeassge: LocaleKeys.login_messages_invalidCredentials,
        );
      } else {
        throw CustomException(
          exceptionMeassge: LocaleKeys.login_messages_generalError,
        );
      }
    } catch (e) {
      log(
        "error happend in FirebaseAuthService in signIn method please check it, the error: $e",
      );
      throw CustomException(
        exceptionMeassge: LocaleKeys.login_messages_generalError,
      );
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
        exceptionMeassge: LocaleKeys.login_messages_generalError,
      );
    }
  }

  @override
  Future<String>? getCurrentUserId() async {
    try {
      var userId = firebaseAuth.currentUser;

      if (userId == null) {
        throw CustomException(
          exceptionMeassge: LocaleKeys.login_messages_generalError,
        );
      }
      return userId.uid;
    } on FirebaseAuthException catch (e) {
      log(
        "error happend in FirebaseAuthService in getCurrentUserId method please check it, the error: $e",
      );
      throw CustomException(
        exceptionMeassge: LocaleKeys.login_messages_generalError,
      );
    }
  }
}
