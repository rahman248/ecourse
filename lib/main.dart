import 'package:ecourse/ui/auth/login.dart';
import 'package:ecourse/ui/auth/register.dart';
import 'package:ecourse/ui/home/home.dart';
import 'package:ecourse/ui/main/navigation.dart';
import 'package:ecourse/ui/onboarding.dart';
import 'package:ecourse/ui/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'utils/constant.dart';

int? isViewed;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('initScreen');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(isViewed);
    }


    return MaterialApp(
        title: 'Ecourse Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
        routes: <String, WidgetBuilder>{
          SPLASH_SCREEN: (BuildContext context) => const SplashScreen(),
          NAV_SCREEN:(BuildContext context) => const NavScreen(),
          ONBOARDING_SCREEN: (BuildContext context) => const OnboardingScreen(),
          LOGIN_SCREEN: (BuildContext context) => const LoginScreen(),
          SIGNUP_SCREEN: (BuildContext context) => const SignUpScreen(),
        });
  }
}
