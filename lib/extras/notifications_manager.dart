import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationManager {
  // ignore: prefer_typing_uninitialized_variables
  var flutterLocalNotificationsPlugin;

  NotificationManager() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    initNotifications();
  }

  getNotificationInstance() {
    return flutterLocalNotificationsPlugin;
  }

  void initNotifications() {
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = IOSInitializationSettings(
      //I AM GETTING AN ERROR ON THIS onDidReceiveLocalNotification
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    var initializationSettings =  InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  void showNotificationDaily(
      int id, String title, String body, int hour, int minute) async {
    var time = Time(hour, minute, 0);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
        id, title, body, time, getPlatformChannelSpecfics());
    if (kDebugMode) {
      print('Notification Succesfully Scheduled at ${time.toString()}');
    }
  }

  getPlatformChannelSpecfics() {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
         'your channel name', 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'Sickle Cell');
    var iOSPlatformChannelSpecifics = const IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);

    return platformChannelSpecifics;
  }

  Future onSelectNotification(String payload) async {
    if (kDebugMode) {
      print('Notification clicked');
    }
    return Future.value(0);
  }

  Future onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
      return Future.value(1);
}

  void removeReminder(int notificationId) {
    flutterLocalNotificationsPlugin.cancel(notificationId);
  }
}