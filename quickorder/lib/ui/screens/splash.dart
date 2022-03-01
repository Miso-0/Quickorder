import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickorder/get/controllers/preference_controller.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    splash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: const SafeArea(
        child: Scaffold(
          body: Center(
            child: SizedBox(
              width: 250,
              height: 250,
              child: Image(
                image: AssetImage(
                  'lib/assets/logo.png',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void splash() {
    var _preferences = Get.find<UserPreferenceController>();
    Timer(const Duration(seconds: 5), () {
      if (!_preferences.isRememberDevice.value) {
        Get.offNamed('/home');
      } else {
        Get.offNamed('/welcome');
      }
    });
  }
}
