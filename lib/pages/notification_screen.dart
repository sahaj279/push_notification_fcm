import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  static const route = '/notification_screen';
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RemoteMessage message =
        ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Title is ${message.notification?.title}'),
            Text('Title is ${message.notification?.body}'),
            Text('Title is ${message.data}'),
          ],
        ),
      ),
    );
  }
}
