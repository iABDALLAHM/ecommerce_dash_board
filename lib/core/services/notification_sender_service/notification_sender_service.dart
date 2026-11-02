abstract class NotificationSenderService {
  Future<String> getAccessToken();
  Future<bool> sendOrderStatusNotification({
    required String fcmToken,
    required String orderId,
    required String newStatus,
  });
}
