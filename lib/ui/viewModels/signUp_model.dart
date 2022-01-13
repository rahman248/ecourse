import 'package:ecourse/services/auth.dart';
import 'package:ecourse/services/navigation.dart';
import 'package:ecourse/shared/dialog_services.dart';
import '../../locator.dart';
import 'base_model.dart';

class SignUpViewModel extends BaseModel {
  final AuthService _authenticationService = locator<AuthService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future signUp({
    required String email,
    required String password,
    required String fullName,
  }) async {
    setBusy(true);

    var result = await _authenticationService.signUpWithEmail(
        email: email,
        password: password,
        fullName: fullName);

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo("");
      } else {
        await _dialogService.showDialog(
          title: 'Sign Up Failure',
          description: 'General sign up failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Sign Up Failure',
        description: result,
      );
    }
  }
}