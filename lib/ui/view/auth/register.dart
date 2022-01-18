import 'package:ecourse/helper/validator.dart';
import 'package:ecourse/ui/shared/shared_styles.dart';
import 'package:ecourse/ui/shared/ui_helpers.dart';
import 'package:ecourse/ui/viewModels/signUp_model.dart';
import 'package:ecourse/ui/widgets/busy_button.dart';
import 'package:ecourse/ui/widgets/text_link.dart';
import 'package:ecourse/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _registerFormKey = GlobalKey<FormState>();

  final _fullnameTextController = TextEditingController();
  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _passwordSecondTextController = TextEditingController();

  final _focusFullname = FocusNode();
  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();
  final _focusPasswordSecond = FocusNode();

  bool _isProcessing = false;
  late bool _showPassword = false;


  @override
  void initState() {
    _showPassword = false;
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) =>
          Scaffold(
            body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: boxDecoration,
                child: Container(
                    height: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40.0,
                    ),

                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 100.0, bottom: 50),
                            child: Text(
                              'REGISTER',
                              style: kTitleStyle,
                            ),
                          ),
                          _buidForm(model),
                        ],
                      ),
                    )
                ),

              ),
            ),
          ),
    );
  }

  Widget _buidForm(SignUpViewModel model){
    return Form(
      key: _registerFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Full Name', style: kLabelStyle),
          verticalSpaceSmall,
          TextFormField(
            controller: _fullnameTextController,
            focusNode: _focusFullname,
            cursorColor: Colors.white,
            inputFormatters: [
              LengthLimitingTextInputFormatter(30),
            ],
            keyboardType: TextInputType.text,
            autofocus: false,
            style: const TextStyle(color: Colors.white),
            validator: (value) => Validator.validateName(name: value),
            decoration: const InputDecoration(
              hintText: "Enter your full name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),

              ),
              filled: true,
              fillColor: Color(0xFF6CA8F1),
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintStyle: kHintTextStyle,
            ),
          ),

          verticalSpaceMedium,
          const Text('Username', style: kLabelStyle),
          verticalSpaceSmall,
          TextFormField(
            controller: _nameTextController,
            focusNode: _focusName,
            cursorColor: Colors.white,
            inputFormatters: [
              LengthLimitingTextInputFormatter(30),
            ],
            keyboardType: TextInputType.text,
            autofocus: false,
            style: const TextStyle(color: Colors.white),
            validator: (value) => Validator.validateName(name: value),
            decoration: const InputDecoration(
              hintText: "Enter your username",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),

              ),
              filled: true,
              fillColor: Color(0xFF6CA8F1),
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintStyle: kHintTextStyle,
            ),
          ),
          verticalSpaceMedium,
          const Text('Email', style: kLabelStyle),
          verticalSpaceSmall,
          TextFormField(
            controller: _emailTextController,
            focusNode: _focusEmail,
            cursorColor: Colors.white,
            inputFormatters: [
              LengthLimitingTextInputFormatter(30),
            ],
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            style: const TextStyle(color: Colors.white),
            validator: (value) => Validator.validateEmail(email: value),
            decoration: const InputDecoration(
              hintText: "Enter your Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),

              ),

              filled: true,
              fillColor: Color(0xFF6CA8F1),
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintStyle: kHintTextStyle,
            ),
          ),
          verticalSpaceMedium,
          const Text('Password', style: kLabelStyle),
          verticalSpaceSmall,
          TextFormField(
            controller: _passwordTextController,
            focusNode: _focusPassword,

            cursorColor: Colors.white,
            inputFormatters: [
              LengthLimitingTextInputFormatter(30),
            ],
            keyboardType: TextInputType.visiblePassword,
            autofocus: false,
            style: const TextStyle(color: Colors.white),
            validator: (value) => Validator.validatePassword(password: value),
            obscureText: _showPassword,
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: (){
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
                child: Icon(
                  _showPassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white,
                ),
              ),
              hintText: "Enter your Password",
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),

              ),
              filled: true,
              fillColor: Color(0xFF6CA8F1),
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintStyle: kHintTextStyle,
            ),
          ),
          verticalSpaceMedium,
          const Text('Retype Password', style: kLabelStyle),
          verticalSpaceSmall,
          TextFormField(
            controller: _passwordSecondTextController,
            focusNode: _focusPasswordSecond,
            inputFormatters: [
              LengthLimitingTextInputFormatter(30),
            ],
            keyboardType: TextInputType.visiblePassword,
            autofocus: false,
            cursorColor: Colors.white,
            style: const TextStyle(color: Colors.white),
            validator: (value) => Validator.validateSecondPassword(password: _passwordTextController.text, passwordSecond: value),
            obscureText: _showPassword,
            decoration: InputDecoration(
              hintText: "Confirm your password",
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),

              ),
              suffixIcon: GestureDetector(
                onTap: (){
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
                child: Icon(
                  _showPassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white,
                ),
              ),
              filled: true,
              fillColor: Color(0xFF6CA8F1),
              contentPadding: const EdgeInsets.only(top: 14.0),
              prefixIcon: const Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintStyle: kHintTextStyle,
            ),
          ),
          verticalSpaceMedium,
          _buildRegisterBtn(model),
          verticalSpaceLarge,
          _buildTextBackBtn(model),
        ],
      ),

    );
  }

  Widget _buildRegisterBtn(SignUpViewModel model) {
    return BusyButton(
      title: 'Login',
      busy: model.busy,
      onPressed: () {
        model.signUp(
          email: _emailTextController.text,
          password: _passwordTextController.text,
          fullName: _fullnameTextController.text,
          username: _nameTextController.text
        );
      },
    );
  }

  Widget _buildTextBackBtn(SignUpViewModel model) {
    return TextLink(
      'Already have accounts?, go back to login',
      onPressed: () {
        model.navigateToLogin();
      },
    );

  }

}

