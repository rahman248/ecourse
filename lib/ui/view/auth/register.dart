import 'package:ecourse/helper/validator.dart';
import 'package:ecourse/ui/shared/shared_styles.dart';
import 'package:ecourse/ui/shared/ui_helpers.dart';
import 'package:ecourse/ui/viewModels/signUp_model.dart';
import 'package:ecourse/ui/widgets/busy_button.dart';
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
            obscureText: true,
            inputFormatters: [
              LengthLimitingTextInputFormatter(30),
            ],
            keyboardType: TextInputType.visiblePassword,
            autofocus: false,
            style: const TextStyle(color: Colors.white),
            validator: (value) => Validator.validatePassword(password: value),
            decoration: const InputDecoration(
              hintText: "Enter your Password",
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
            focusNode: _focusPassword,
            obscureText: true,
            inputFormatters: [
              LengthLimitingTextInputFormatter(30),
            ],
            keyboardType: TextInputType.visiblePassword,
            autofocus: false,
            style: const TextStyle(color: Colors.white),
            validator: (value) => Validator.validateSecondPassword(password: _passwordTextController.text, passwordSecond: value),
            decoration: const InputDecoration(
              hintText: "Confirm your password",
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
                Icons.lock,
                color: Colors.white,
              ),
              hintStyle: kHintTextStyle,
            ),
          ),
          verticalSpaceMedium,
          _buildRegisterBtn(model),

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

}
    /*final Stream<QuerySnapshot> users = FirebaseFirestore.instance.collection('users').snapshots();
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF73AEF5),
                    Color(0xFF61A4F1),
                    Color(0xFF478DE0),
                    Color(0xFF398AE5),
                  ],
                  stops: [0.1, 0.4, 0.7, 0.9],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Flexible(
                      fit: FlexFit.loose,
                      flex: 5,
                      child: Text(
                        'Register',
                        style: kTitleStyle,
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    _buildEmailTF(),
                    _buildUsernameTF(),
                    const SizedBox(height: 20.0),
                    const Divider(
                      color: Colors.black,
                    ),
                    _buildPasswordTF(),
                    _buildConfirmPasswordTF(),
                    _buildAcceptUserAgreement(),
                    const Expanded(child: SizedBox(height: 10.0)),
                    _buildRegisterBtn()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Email',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(err: kEmailNullError);
              } else if (emailValidatorRegExp.hasMatch(value)) {
                removeError(err: kInvalidEmailError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addErr(err: kEmailNullError);
                return "";
              } else if (!emailValidatorRegExp.hasMatch(value)) {
                addErr(err: kInvalidEmailError);
                return "";
              }
              return email;
            },
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'CM Sans Serif',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUsernameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Username',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(err: kEmailNullError);
              } else if (emailValidatorRegExp.hasMatch(value)) {
                removeError(err: kInvalidEmailError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addErr(err: kEmailNullError);
                return "";
              } else {
                return "";
              }
            },
            *//*keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'CM Sans Serif',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your username',
              hintStyle: kHintTextStyle,
            ),*//*
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Password',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: const TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'CM Sans Serif',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Confirm Password',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: const TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'CM Sans Serif',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Confirm Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAcceptUserAgreement() {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(right: 75.0),
              child: Row(
                children: [
                  Theme(
                    data: ThemeData(unselectedWidgetColor: Colors.white),
                    child: Checkbox(
                        value: _agree,
                        checkColor: Colors.green,
                        activeColor: Colors.white,
                        onChanged: (value) {
                          setState(() {
                            _agree = value!;
                          });
                        }),
                  ),
                  const Text(
                    'I agree to the Terms and Conditions',
                    style: kLabelStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegisterBtn() {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 170),
              child: ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    _formKey.currentState!.save();
                    // if all are valid then go to success screen
                   // Navigator.pushNamed(context, CompleteProfileScreen.routeName);
                  }
                },
                child: const Text(
                  'Submit',
                  style: kLabelStyle,
                ),
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Submit',
                  style: kLabelStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/

