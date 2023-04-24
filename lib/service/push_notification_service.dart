/* import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  PushNotificationService._();

  factory PushNotificationService() => _instance;

  static final PushNotificationService _instance = PushNotificationService._();

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  bool _initialized = false;

  Future<void> init() async {
    await Future.delayed(const Duration(milliseconds: 1000), () async {
      FirebaseMessaging.instance.subscribeToTopic('all');
      FirebaseMessaging.instance.subscribeToTopic(Platform.isIOS ? 'ios' : 'android');

      FirebaseMessaging.instance.getAPNSToken().then((value) {
        //print('Token: $value');
      });

      FirebaseMessaging.instance.getToken().then((value) {});

      if (!_initialized) {
        // For iOS request permission first.
        NotificationSettings settings = await messaging.requestPermission(
          alert: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true,
        );

        _initialized = true;
      }
    });
  }
} */