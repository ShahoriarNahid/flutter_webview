import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../base/base.dart';
import '../main.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _updateAppbar();

    super.initState();
    Base.notificationController.initOnesignalFunction();
    Base.notificationController.handlePromptForPushPermission();
    Future.delayed(const Duration(seconds: 2), () {
      Get.to(() => const WebViewExample());
    });
  }

  void _updateAppbar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 10, 114, 199),
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ));
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.top,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 98, 178, 243),
              Color.fromARGB(255, 50, 138, 216),
              Color.fromARGB(255, 47, 107, 163),
              Color.fromARGB(255, 23, 65, 110),
              Color(0xFF073B7A),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 30),
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
