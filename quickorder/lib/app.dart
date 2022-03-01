import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickorder/admin/admin_home.dart';
import 'package:quickorder/get/binders/binder.dart';
import 'package:quickorder/get/controllers/preference_controller.dart';
import 'package:quickorder/ui/screens/home.dart';
import 'package:quickorder/ui/screens/restaurent_view.dart';
import 'package:quickorder/ui/screens/search.dart';
import 'package:quickorder/ui/screens/splash.dart';
import 'package:quickorder/ui/themes/themes.dart';
import 'package:quickorder/ui/ur/welcome.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _preferences = Get.put(UserPreferenceController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: PrimaryBinder(),
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => const Splash()),
        GetPage(name: '/home', page: () => const Home()),
        GetPage(name: '/search', page: () => const Search()),
        GetPage(name: '/restaurentview', page: () => const RestaurentView()),
        GetPage(name: '/admin', page: () => const AdminHome()),
        GetPage(name: '/welcome', page: () => const Welcome()),
      ],
      themeMode: _preferences.getThemeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}
