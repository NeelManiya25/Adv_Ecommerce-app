import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';
import 'views/screens/LoginPage.dart';
import 'views/screens/cart_page.dart';
import 'views/screens/deatils_page.dart';
import 'views/screens/homepage.dart';
import 'views/screens/singupPage.dart';
import 'views/screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
    getPages: [
      GetPage(name: '/splsw', page: () => Splash()),
      GetPage(name: '/', page: () => login_page()),
      GetPage(name: '/sign', page: () => Signup_page()),
      GetPage(name: '/HomePage', page: () => HomePage()),
      GetPage(name: '/details', page: () => Details_page()),
      GetPage(name: '/cart', page: () => cart_page()),
    ],
  ));
}
