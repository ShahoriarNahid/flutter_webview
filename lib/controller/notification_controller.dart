import 'package:flutter_webview/helpers/k_log.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class NotificationController extends GetxController {
  final enableConsentButton = RxBool(false);
  final notificationEnable = RxBool(false);
  final requireConsent = RxBool(false);
  final debugLabelString = RxString('');

  handlePromptForPushPermission() {
    OneSignal.Notifications.requestPermission(true);
  }

  Future<void> initOnesignalFunction() async {
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

    OneSignal.Debug.setAlertLevel(OSLogLevel.none);
    OneSignal.consentRequired(requireConsent.value);

    // NOTE: Replace with your own app ID from https://www.onesignal.com
    OneSignal.initialize("963f838c-8337-4fbf-9a43-974824978391");
    await OneSignal.LiveActivities.setupDefault();
    await OneSignal.Notifications.clearAll();
    OneSignal.User.addObserver((state) {
      var userState = state.jsonRepresentation();
      kLog('OneSignal user changed: $userState');
    });

    OneSignal.Notifications.addPermissionObserver((state) {
      kLog("Has permission $state");
    });

    OneSignal.Notifications.addClickListener((event) {
      kLog('NOTIFICATION CLICK LISTENER CALLED WITH EVENT: $event');

      debugLabelString.value =
          "Clicked notification: \n${event.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
    });

    OneSignal.Notifications.addForegroundWillDisplayListener((event) {
      kLog(
          'NOTIFICATION WILL DISPLAY LISTENER CALLED WITH: ${event.notification.jsonRepresentation()}');

      /// Display Notification, preventDefault to not display
      event.preventDefault();

      /// Do async work

      /// notification.display() to display after preventing default
      event.notification.display();

      debugLabelString.value =
          "Notification received in foreground notification: \n${event.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
    });

    OneSignal.InAppMessages.addClickListener((event) {
      debugLabelString.value =
          "In App Message Clicked: \n${event.result.jsonRepresentation().replaceAll("\\n", "\n")}";
    });
    OneSignal.InAppMessages.addWillDisplayListener((event) {
      kLog("ON WILL DISPLAY IN APP MESSAGE ${event.message.messageId}");
    });
    OneSignal.InAppMessages.addDidDisplayListener((event) {
      kLog("ON DID DISPLAY IN APP MESSAGE ${event.message.messageId}");
    });
    OneSignal.InAppMessages.addWillDismissListener((event) {
      kLog("ON WILL DISMISS IN APP MESSAGE ${event.message.messageId}");
    });
    OneSignal.InAppMessages.addDidDismissListener((event) {
      kLog("ON DID DISMISS IN APP MESSAGE ${event.message.messageId}");
    });

    enableConsentButton.value = requireConsent.value;

    // Some examples of how to use In App Messaging public methods with OneSignal SDK
    oneSignalInAppMessagingTriggerExamples();

    // Some examples of how to use Outcome Events public methods with OneSignal SDK
    oneSignalOutcomeExamples();

    // OneSignal.InAppMessages.paused(true);
  }

  oneSignalInAppMessagingTriggerExamples() async {
    /// Example addTrigger call for IAM
    /// This will add 1 trigger so if there are any IAM satisfying it, it
    /// will be shown to the user
    OneSignal.InAppMessages.addTrigger("trigger_1", "one");

    /// Example addTriggers call for IAM
    /// This will add 2 triggers so if there are any IAM satisfying these, they
    /// will be shown to the user
    Map<String, String> triggers = new Map<String, String>();
    triggers["trigger_2"] = "two";
    triggers["trigger_3"] = "three";
    OneSignal.InAppMessages.addTriggers(triggers);

    // Removes a trigger by its key so if any future IAM are pulled with
    // these triggers they will not be shown until the trigger is added back
    OneSignal.InAppMessages.removeTrigger("trigger_2");

    // Create a list and bulk remove triggers based on keys supplied
    List<String> keys = ["trigger_1", "trigger_3"];
    OneSignal.InAppMessages.removeTriggers(keys);

    // Toggle pausing (displaying or not) of IAMs
    OneSignal.InAppMessages.paused(true);
    var arePaused = await OneSignal.InAppMessages.arePaused();
    kLog('Notifications paused $arePaused');
  }

  oneSignalOutcomeExamples() async {
    OneSignal.Session.addOutcome("normal_1");
    OneSignal.Session.addOutcome("normal_2");

    OneSignal.Session.addUniqueOutcome("unique_1");
    OneSignal.Session.addUniqueOutcome("unique_2");

    OneSignal.Session.addOutcomeWithValue("value_1", 3.2);
    OneSignal.Session.addOutcomeWithValue("value_2", 3.9);
  }
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
// }
