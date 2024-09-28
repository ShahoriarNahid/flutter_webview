// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_webview/base/base_bindings.dart';
import 'package:flutter_webview/splash_page.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'base/base.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //firebase push notification
  // await Firebase.initializeApp();
  // await NotificationService.init();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(GetMaterialApp(
    initialBinding: BaseBindings(),
    home: SplashPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class WebViewExample extends StatefulWidget {
  const WebViewExample({super.key});

  @override
  State<WebViewExample> createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  // final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  // late final WebViewController controller;
// 963f838c-8337-4fbf-9a43-974824978391
  @override
  void initState() {
    super.initState();
    //firebase push notification
    // firebaseMessaging.requestPermission();
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   // Handle the message here
    //   kLog('Message received: ${message.notification?.title}');
    //   Base.notificationController
    //       .sendNotification(message.notification!.title!);
    // });

// OneSignal push notification
    //   String _debugLabelString = "";
    //   bool _requireConsent = false;
    //   bool _enableConsentButton = false;

    //   OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

    //   OneSignal.Debug.setAlertLevel(OSLogLevel.none);
    //   OneSignal.consentRequired(_requireConsent);

    //   // NOTE: Replace with your own app ID from https://www.onesignal.com
    //   OneSignal.initialize("963f838c-8337-4fbf-9a43-974824978391");
    //   OneSignal.LiveActivities.setupDefault();
    //   OneSignal.Notifications.clearAll();
    //   OneSignal.User.addObserver((state) {
    //     var userState = state.jsonRepresentation();
    //     kLog('OneSignal user changed: $userState');
    //   });

    //   OneSignal.Notifications.addPermissionObserver((state) {
    //     kLog("Has permission $state");
    //   });
    //   OneSignal.Notifications.addClickListener((event) {
    //     kLog('NOTIFICATION CLICK LISTENER CALLED WITH EVENT: $event');
    //     this.setState(() {
    //       _debugLabelString =
    //           "Clicked notification: \n${event.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
    //     });
    //   });

    //   OneSignal.Notifications.addForegroundWillDisplayListener((event) {
    //     kLog(
    //         'NOTIFICATION WILL DISPLAY LISTENER CALLED WITH: ${event.notification.jsonRepresentation()}');

    //     /// Display Notification, preventDefault to not display
    //     event.preventDefault();

    //     /// Do async work

    //     /// notification.display() to display after preventing default
    //     event.notification.display();

    //     this.setState(() {
    //       _debugLabelString =
    //           "Notification received in foreground notification: \n${event.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
    //     });
    //   });

    //   OneSignal.InAppMessages.addClickListener((event) {
    //     this.setState(() {
    //       _debugLabelString =
    //           "In App Message Clicked: \n${event.result.jsonRepresentation().replaceAll("\\n", "\n")}";
    //     });
    //   });
    //   OneSignal.InAppMessages.addWillDisplayListener((event) {
    //     kLog("ON WILL DISPLAY IN APP MESSAGE ${event.message.messageId}");
    //   });
    //   OneSignal.InAppMessages.addDidDisplayListener((event) {
    //     kLog("ON DID DISPLAY IN APP MESSAGE ${event.message.messageId}");
    //   });
    //   OneSignal.InAppMessages.addWillDismissListener((event) {
    //     kLog("ON WILL DISMISS IN APP MESSAGE ${event.message.messageId}");
    //   });
    //   OneSignal.InAppMessages.addDidDismissListener((event) {
    //     kLog("ON DID DISMISS IN APP MESSAGE ${event.message.messageId}");
    //   });

    //   this.setState(() {
    //     _enableConsentButton = _requireConsent;
    //   });

    //   // Some examples of how to use In App Messaging public methods with OneSignal SDK
    //   oneSignalInAppMessagingTriggerExamples();

    //   // Some examples of how to use Outcome Events public methods with OneSignal SDK
    //   oneSignalOutcomeExamples();

    //   OneSignal.InAppMessages.paused(true);
    //   Base.notificationController.handlePromptForPushPermission();

    // }

    // oneSignalInAppMessagingTriggerExamples() async {
    //   /// Example addTrigger call for IAM
    //   /// This will add 1 trigger so if there are any IAM satisfying it, it
    //   /// will be shown to the user
    //   OneSignal.InAppMessages.addTrigger("trigger_1", "one");

    //   /// Example addTriggers call for IAM
    //   /// This will add 2 triggers so if there are any IAM satisfying these, they
    //   /// will be shown to the user
    //   Map<String, String> triggers = new Map<String, String>();
    //   triggers["trigger_2"] = "two";
    //   triggers["trigger_3"] = "three";
    //   OneSignal.InAppMessages.addTriggers(triggers);

    //   // Removes a trigger by its key so if any future IAM are pulled with
    //   // these triggers they will not be shown until the trigger is added back
    //   OneSignal.InAppMessages.removeTrigger("trigger_2");

    //   // Create a list and bulk remove triggers based on keys supplied
    //   List<String> keys = ["trigger_1", "trigger_3"];
    //   OneSignal.InAppMessages.removeTriggers(keys);

    //   // Toggle pausing (displaying or not) of IAMs
    //   OneSignal.InAppMessages.paused(true);
    //   var arePaused = await OneSignal.InAppMessages.arePaused();
    //   kLog('Notifications paused $arePaused');
    // }

    // oneSignalOutcomeExamples() async {
    //   OneSignal.Session.addOutcome("normal_1");
    //   OneSignal.Session.addOutcome("normal_2");

    //   OneSignal.Session.addUniqueOutcome("unique_1");
    //   OneSignal.Session.addUniqueOutcome("unique_2");

    //   OneSignal.Session.addOutcomeWithValue("value_1", 3.2);
    //   OneSignal.Session.addOutcomeWithValue("value_2", 3.9);
    // }

    // #docregion webview_widget
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        backgroundColor: Colors.black,
        body: Base.webViewController.progressValue.value == 1.0
            ? WebViewWidget(
                controller: Base.webViewController.webViewController)
            : Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CircularProgressIndicator(
                    semanticsLabel:
                        Base.webViewController.progressValue.value.toString(),
                    semanticsValue:
                        Base.webViewController.progressValue.value.toString(),
                    strokeWidth: 5,
                    value: Base.webViewController.progressValue
                        .value, // Observe progress changes
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    color: Colors.blue,
                  ),
                ),
              )
        // WebViewWidget(controller: Base.notificationController.webController),
        ));
  }
  // #enddocregion webview_widget
}
