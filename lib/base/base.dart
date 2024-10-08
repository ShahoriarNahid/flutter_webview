import 'package:flutter_webview/controller/notification_controller.dart';
import 'package:flutter_webview/controller/webview_controller.dart';
import 'package:get/get.dart';

class Base {
  Base._();
  static final notificationController = Get.find<NotificationController>();
  static final webViewController = Get.find<WebViewMobileController>();
}
