import 'package:flutter_webview/helpers/k_log.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class NotificationController extends GetxController {
  void handlePromptForPushPermission() {
    kLog("Prompting for Permission");
    OneSignal.Notifications.requestPermission(true);
  }

  // // Send notification
  // Future<void> sendNotification(String title) async {
  //   // Android initialization
  //   const AndroidInitializationSettings initializationSettingsAndroid =
  //       AndroidInitializationSettings('@mipmap/ic_launcher');

  //   // iOS initialization
  //   final DarwinInitializationSettings initializationSettingsIOS =
  //       DarwinInitializationSettings(
  //     requestAlertPermission: true,
  //     requestBadgePermission: true,
  //     requestSoundPermission: true,
  //   );
  //   final LinuxInitializationSettings initializationSettingsLinux =
  //       LinuxInitializationSettings(defaultActionName: 'Open notification');
  //   final InitializationSettings initializationSettings =
  //       InitializationSettings(
  //           android: initializationSettingsAndroid,
  //           iOS: initializationSettingsIOS,
  //           // iOS: initializationSettingsDarwin,
  //           linux: initializationSettingsLinux);

  //   // request notification permissions
  //   flutterLocalNotificationsPlugin
  //       .resolvePlatformSpecificImplementation<
  //           AndroidFlutterLocalNotificationsPlugin>()!
  //       .requestNotificationsPermission();

  //   const AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       AndroidNotificationDetails(
  //     'reminder_channel_id', 'reminder_channel_name',
  //     importance: Importance.max,
  //     priority: Priority.high,
  //     sound:
  //         RawResourceAndroidNotificationSound('notification'), // Custom sound
  //     playSound: true,
  //   );

  //   const NotificationDetails platformChannelSpecifics = NotificationDetails(
  //     android: androidPlatformChannelSpecifics,
  //   );

  //   await flutterLocalNotificationsPlugin.show(
  //     1,
  //     'Task Reminder',
  //     'It\'s time for your task: $title',
  //     platformChannelSpecifics,
  //   );

  //   flutterLocalNotificationsPlugin.initialize(
  //     initializationSettings,
  //     onDidReceiveNotificationResponse:
  //         (NotificationResponse notificationResponse) async {
  //       // Base.taskController.onNotificationTap(task);
  //     },
  //   );
  // }
}
