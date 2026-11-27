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
  },
  "dashboard": {
    "welcomeBack": "مرحباً بعودتك، {name}",
    "welcomeLoading": "مرحباً بعودتك",
    "title": "لوحة الإدارة",
    "role": "مسؤول",
    "todayOrders": "الطلبات اليوم",
    "totalProducts": "إجمالي المنتجات",
    "actionsTitle": "الإجراءات والعمليات",
    "actions": {
      "addProduct": "إضافة منتج جديد",
      "addProductDescription": "إضافة فاكهة أو خضار جديدة مع السعر والتفاصيل",
      "manageOrders": "إدارة الطلبات",
      "manageOrdersDescription": "متابعة وتحديث حالات طلبات الزبائن والشحن",
      "featuredProducts": "إضافة المنتجات المميزة",
      "featuredProductsDescription": "رفع وتحديث بانرات العروض المميزة في الصفحة الرئيسية",
      "sendNotification": "إرسال إشعار ترويجي",
      "sendNotificationDescription": "إرسال رسائل وحملات تسويقية وتنبيهات لجميع المستخدمين"
    },
    "signOut": "تسجيل الخروج من لوحة التحكم",
    "signOutDialog": {
      "title": "هل ترغب في تسجيل الخروج؟",
      "message": "ستحتاج إلى تسجيل الدخول مرة أخرى للوصول إلى لوحة الإدارة",
      "decline": "لا أرغب"
    },
    "messages": {
      "signOutSuccess": "تم تسجيل الخروج بنجاح"
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
  },
  "dashboard": {
    "welcomeBack": "Welcome back, {name}",
    "welcomeLoading": "Welcome back",
    "title": "Admin Dashboard",
    "role": "Admin",
    "todayOrders": "Today's Orders",
    "totalProducts": "Total Products",
    "actionsTitle": "Actions",
    "actions": {
      "addProduct": "Add New Product",
      "addProductDescription": "Add a new fruit or vegetable with price and details",
      "manageOrders": "Manage Orders",
      "manageOrdersDescription": "Monitor and update customer orders and shipping",
      "featuredProducts": "Featured Products",
      "featuredProductsDescription": "Update promotional banners on the homepage",
      "sendNotification": "Send Promotional Notification",
      "sendNotificationDescription": "Send marketing messages and alerts to all users"
    },
    "signOut": "Sign out of the dashboard",
    "signOutDialog": {
      "title": "Sign out?",
      "message": "You will need to sign in again to access the dashboard",
      "decline": "Cancel"
    },
    "messages": {
      "signOutSuccess": "Signed out successfully"
    }
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
