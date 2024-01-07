import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper {
  static final _notification = FlutterLocalNotificationsPlugin();
  static Future initialize() async {
    const androidInitialize =
        AndroidInitializationSettings("mipmap/ic_launcher");
    const initializationSettings =
        InitializationSettings(android: androidInitialize);
    await _notification.initialize(initializationSettings);
  }

  static Future _notificationDetails() async => const NotificationDetails(
      android: AndroidNotificationDetails("GünSayaci", "day_counterr_1",
          importance: Importance.max));

  static Future showNotification({
    int id = 0,
    required String title,
    required String body,
    required String payload,
  }) async =>
      _notification.show(id, title, body, await _notificationDetails());
}
