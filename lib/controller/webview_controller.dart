import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../helpers/k_log.dart';

class WebViewMobileController extends GetxController {
  late WebViewController webViewController;

  final progressValue = RxDouble(0.0);

  @override
  void onInit() {
    super.onInit();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
            // Assuming you have a method to update the loading bar on the screen.

            kLog('Page loading progress: $progress');
            progressValue.value = progress.toDouble() / 100;
            kLog('Page loading progressValue: ${progressValue.value}');
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://flutter.dev/'));
  }
}
