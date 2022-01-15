import 'package:ecourse/services/auth.dart';
import 'package:ecourse/services/navigation.dart';
import 'package:ecourse/utils/constant.dart';

import '../../locator.dart';
import 'base_model.dart';

class SplashViewModel extends BaseModel{
  final AuthService _authenticationService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {

    bool newStartInUser = await _authenticationService.isNewStartUser();

    if (newStartInUser){
      Future.delayed(const Duration(seconds: 3), () {
        _navigationService.navigateTo(OnBoardViewRoute);
      });

    } else {
      Future.delayed(const Duration(seconds: 3), () {
        _navigationService.navigateTo(LoginViewRoute);
      });

    }

    /*if (hasLoggedInUser) {
      _navigationService.navigateTo(HomeViewRoute);
    } else {
      _navigationService.navigateTo(LoginViewRoute);
    }*/
  }
}