
import 'package:ecourse/helper/dialog_manager.dart';
import 'package:ecourse/services/navigation.dart';
import 'package:ecourse/shared/dialog_services.dart';
import 'package:ecourse/ui/router.dart';
import 'package:ecourse/ui/view/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'locator.dart';


main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) async {
    await Firebase.initializeApp();
    setupLocator();
    runApp(const MyApp());
  });

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Course',
      builder: (context, child) =>
          Navigator(
            key: locator<DialogService>().dialogNavigationKey,
            onGenerateRoute: (settings) =>
                MaterialPageRoute(
                    builder: (context) =>
                        DialogManager(child: child as Widget)),
          ),
      navigatorKey: locator<NavigationService>().navigationKey,

      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: Theme
            .of(context)
            .textTheme
            .apply(
          fontFamily: 'Open Sans',
        ),
      ),
      home: const SplashScreen(),
      onGenerateRoute: generateRoute,
    );
  }
}