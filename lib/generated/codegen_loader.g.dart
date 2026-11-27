// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ar = {
  "common": {
    "email": "البريد الإلكتروني",
    "password": "كلمة المرور",
    "confirm": "تأكيد",
    "cancel": "إلغاء",
    "loading": "جارٍ التحميل",
    "error": "خطأ"
  },
  "login": {
    "adminPortal": "بوابة المسؤولين",
    "title": "تسجيل الدخول للوحة الإدارة",
    "subtitle": "مخصص للمسؤولين فقط. أدخل بيانات حسابك للمتابعة",
    "forgotPassword": "نسيت كلمة المرور؟",
    "loginButton": "تسجيل الدخول",
    "messages": {
      "success": "تم تسجيل الدخول بنجاح",
      "emailRequired": "يرجى إدخال البريد الإلكتروني",
      "passwordRequired": "يرجى إدخال كلمة المرور",
      "invalidCredentials": "البريد الإلكتروني أو كلمة المرور غير صحيحة",
      "userNotFound": "هذا المستخدم غير موجود",
      "wrongPassword": "كلمة المرور غير صحيحة",
      "networkError": "تعذر الاتصال بالشبكة. يرجى التحقق من الاتصال",
      "unauthorized": "هذا الحساب ليس لديه صلاحية الدخول إلى لوحة الإدارة",
      "generalError": "حدث خطأ، يرجى المحاولة مرة أخرى"
    }
  }
};
static const Map<String,dynamic> _en = {
  "common": {
    "email": "Email",
    "password": "Password",
    "confirm": "Confirm",
    "cancel": "Cancel",
    "loading": "Loading",
    "error": "Error"
  },
  "login": {
    "adminPortal": "Admin Portal",
    "title": "Sign in to the dashboard",
    "subtitle": "For administrators only. Enter your account details to continue",
    "forgotPassword": "Forgot password?",
    "loginButton": "Sign In",
    "messages": {
      "success": "Signed in successfully",
      "emailRequired": "Please enter your email",
      "passwordRequired": "Please enter your password",
      "invalidCredentials": "Email or password is incorrect",
      "userNotFound": "This user does not exist",
      "wrongPassword": "Password is incorrect",
      "networkError": "Unable to connect. Please check your network connection",
      "unauthorized": "This account does not have permission to access the dashboard",
      "generalError": "An error occurred. Please try again"
    }
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
