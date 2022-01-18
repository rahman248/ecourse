
import 'package:ecourse/ui/view/home/home.dart';
import 'package:ecourse/ui/view/auth/login.dart';
import 'package:ecourse/ui/view/auth/register.dart';
import 'package:ecourse/ui/view/onboarding.dart';
import 'package:ecourse/ui/view/popular/popular.dart';
import 'package:ecourse/ui/view/profile/profile.dart';
import 'package:ecourse/utils/constant.dart';
import 'package:flutter/material.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {

    case OnBoardViewRoute:
      return _getPageRoute(
        routeName: settings.name as String,
        viewToShow: const OnboardingScreen(),
      );
    case LoginViewRoute:
      return _getPageRoute(
        routeName: settings.name as String,
        viewToShow: const LoginScreen(),
      );
    case SignUpViewRoute:
      return _getPageRoute(
        routeName: settings.name as String,
        viewToShow: const SignUpScreen(),
      );

    case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name as String,
        viewToShow: const HomeScreen(),
      );
    case ProfileViewRoute:
      return _getPageRoute(
        routeName: settings.name as String,
        viewToShow: const ProfileScreen(),
      );
    case PopularViewRoute:

      return _getPageRoute(
        routeName: settings.name as String,
        viewToShow: const PopularScreen(),
      );
/*    case CategoryViewRoute:
      var postToEdit = settings.arguments as Post;
      return _getPageRoute(
        routeName: settings.name as String,
        viewToShow: CreateCategoryView(
          edittingPost: postToEdit,
        ),
      );*/
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
                child: Text('No route defined for ${settings.name}')),
          ));
  }
}

PageRoute _getPageRoute({required String routeName, required Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}