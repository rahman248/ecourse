import 'package:ecourse/services/auth.dart';
import 'package:ecourse/services/navigation.dart';
import 'package:ecourse/utils/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/animation.dart';
import 'package:twitter_login/entity/user.dart';

import '../../locator.dart';
import 'base_model.dart';

class OnBoardingViewModel extends BaseModel{

  final AuthService _authenticationService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleOnBoardLogic() async {
    var isUsers = await _authenticationService.isUserLoggedIn();
    bool hasLoggedInUser;
    if (isUsers){
      hasLoggedInUser = true;
    } else {
      hasLoggedInUser = false;
    }

    if (hasLoggedInUser) {
      _navigationService.navigateTo(HomeViewRoute);
    } else {
      _navigationService.navigateTo(LoginViewRoute);
    }

  }

  Future<void> setStoreFirstTime(bool isFirstTime) async {
    await _authenticationService.setIsFirst(isFirstTime);
  }


}