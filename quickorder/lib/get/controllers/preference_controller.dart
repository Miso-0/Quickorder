import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferenceController extends GetxController {
  var themeSet = "light".obs;
  var isRememberDevice = false.obs;

  @override
  void onInit() {
    initPreferences();
    super.onInit();
  }

  initPreferences() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    if (_pref.getString('ThemeMode') != null) {
      themeSet(_pref.getString('ThemeMode'));
    }

    if (_pref.getBool('RememberDevice') != null) {
      isRememberDevice(_pref.getBool('RememberDevice'));
    }
  }

  setTheme(String value) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setString('ThemeMode', value);
  }

  rememberDevice(bool decision) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setBool('RememberDevice', decision);
  }

  ThemeMode get getThemeMode =>
      themeSet.value == "light" ? ThemeMode.light : ThemeMode.dark;
}
