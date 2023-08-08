import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:roomfinding/app.dart';
import 'package:roomfinding/bindings/all_bindings.dart';

void main() async {
  AwesomeNotifications().initialize('resource://drawable/launcher', [
    NotificationChannel(
      channelGroupKey: 'basic_channel_group',
      channelKey: 'basic_channel',
      channelName: 'Login Notification',
      channelDescription: 'notification channel for Login',
      defaultColor: const Color(0xFF905aDD),
      importance: NotificationImportance.Max,
      ledColor: Colors.white,
    ),
    NotificationChannel(
      channelGroupKey: 'alert_channel_group',
      channelKey: 'Alert_channel',
      channelName: 'alert Notification',
      channelDescription: 'notification channel for alert',
      defaultColor: const Color(0xFF905aDD),
      importance: NotificationImportance.Max,
      ledColor: Colors.white,
    )
  ]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MyBindings(),
      debugShowCheckedModeBanner: false,
      home: const SplashPageScreen(),
    );
  }
}
