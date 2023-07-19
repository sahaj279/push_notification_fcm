import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notification_fcm/firebase/firebase_options.dart';
import 'package:notification_fcm/pages/my_home_page.dart';
import 'package:notification_fcm/pages/notification_screen.dart';

import 'firebase/firebase_api.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorKey: navigatorKey,
      home: const MyHomePage(title: 'Notifications'),
      routes: {
        NotificationScreen.route: (context) => const NotificationScreen()
      },
    );
  }
}
