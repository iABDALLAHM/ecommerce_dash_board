import 'dart:convert';
import 'package:ecommerce_dash_board/core/services/notification_sender_service/notification_sender_service.dart';
import 'package:flutter/services.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

class FirebaseNotificationSenderService implements NotificationSenderService {
  static const List<String> _scopes = [
    'https://www.googleapis.com/auth/firebase.messaging',
  ];

  @override
  Future<String> getAccessToken() async {
    final jsonString = await rootBundle.loadString(
      'assets/service_account.json',
    );
    final accountCredentials = ServiceAccountCredentials.fromJson(jsonString);

    final client = await clientViaServiceAccount(accountCredentials, _scopes);
    final accessToken = client.credentials.accessToken.data;
    client.close();

    return accessToken;
  }

  @override
  Future<bool> sendOrderStatusNotification({
    required String fcmToken,
    required String orderId,
    required String newStatus,
  }) async {
    try {
      final jsonString = await rootBundle.loadString(
        'assets/service_account.json',
      );
      final Map<String, dynamic> keyData = jsonDecode(jsonString);
      final String projectId = keyData['project_id'];

      final String accessToken = await getAccessToken();

      final notificationContent = _getNotificationContent(newStatus);

      final url = Uri.parse(
        'https://fcm.googleapis.com/v1/projects/$projectId/messages:send',
      );

      final body = {
        "message": {
          "token": fcmToken,
          "notification": {
            "title": notificationContent['title'],
            "body": notificationContent['body'],
          },
          "data": {
            "orderId": orderId,
            "click_action": "FLUTTER_NOTIFICATION_CLICK",
          },
        },
      };

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        print("✅ تم إرسال الإشعار للعميل بنجاح");
        return true;
      } else {
        print("❌ فشل إرسال الإشعار: ${response.statusCode} - ${response.body}");
        return false;
      }
    } catch (e) {
      print("❌ خطأ أثناء إرسال الإشعار: $e");
      return false;
    }
  }

  Map<String, String> _getNotificationContent(String status) {
    switch (status.toLowerCase()) {
      case 'processing':
        return {
          'title': 'طلبك قيد التحضير 📦',
          'body': 'نحن نقوم الآن بتجهيز منتجاتك بكل عناية.',
        };
      case 'shipping':
        return {
          'title': 'طلبك في الطريق إليك 🚚',
          'body': 'المندوب استلم شحنتك وهو في طريقه لعنوانك الآن.',
        };
      case 'delivered':
        return {
          'title': 'تم التوصيل بنجاح 🎉',
          'body': 'نتمنى أن تنال المنتجات إعجابك! شكراً لتسوقك معنا.',
        };
      default:
        return {
          'title': 'تحديث بخصوص طلبك 🔔',
          'body': 'تم تحديث حالة طلبك، اضغط هنا لمتابعة التفاصيل.',
        };
    }
  }
}
