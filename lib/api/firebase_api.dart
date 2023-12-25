import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print("title: :  ${message.notification?.title}");
  print("body: :  ${message.notification?.body}");
  print("Payload: :  ${message.data}");
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    print("token: $fcmToken");
    debugPrint("token $fcmToken");

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}
