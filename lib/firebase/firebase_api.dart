import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notification_fcm/main.dart';
import 'package:notification_fcm/pages/notification_screen.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications',
    importance: Importance.defaultImportance,
  );
  final _localNotifications = FlutterLocalNotificationsPlugin();

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    navigatorKey.currentState?.pushNamed(
      NotificationScreen.route,
      arguments: message,
    );
  }

  Future<void> handleBackgroundMessage(RemoteMessage message) async {
    print('Title is ${message.notification?.title}');
    print(message.notification?.body);
    print(message.data);
  }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
//When app is in terminated state and app opens from notification
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    //When app is running in background
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    // When app is in background or terminated state
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    FirebaseMessaging.onMessage.listen((message) {
      print(message.notification!.title);
      final notification = message.notification;
      if (notification == null) {
        return;
      }
      print('show local notification');
      _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            icon: '@mipmap/ic_launcher',
          ),
        ),
        payload: jsonEncode(message.toMap()),
      );
      print('shown');
    });
  }
  void onDidReceiveLocalNotification(
    int id, String title, String body, String payload) async {
      final message = RemoteMessage.fromMap(jsonDecode(payload));
      print('message $message');
      handleMessage(message);
}
  Future initLocalNotification() async {
    print('initializing local notif');
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOs = DarwinInitializationSettings();
    const setting = InitializationSettings(
      android: android,
      iOS: iOs,
    );
    print('initializing settings');
    await _localNotifications.initialize(setting,
        onDidReceiveNotificationResponse:
        (payload) {
      final message = RemoteMessage.fromMap(jsonDecode(payload.payload!));
      handleMessage(message);
    }
    );


    final platform = _localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final _fcmToken = await _firebaseMessaging.getToken();
    //This is the token that we use to sent notification to a particular device and we should actually save it somewhere
    print('Token is $_fcmToken');
    initPushNotifications();
    initLocalNotification();
  }
}
