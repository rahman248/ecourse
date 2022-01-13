import 'package:ecourse/helper/validator.dart';
import 'package:ecourse/services/auth.dart';
import 'package:ecourse/services/firestore.dart';
import 'package:ecourse/ui/home/home.dart';
import 'package:ecourse/ui/shared/shared_styles.dart';
import 'package:ecourse/ui/shared/ui_helpers.dart';
import 'package:ecourse/ui/viewModels/login_model.dart';
import 'package:ecourse/ui/widgets/busy_button.dart';
import 'package:ecourse/ui/widgets/text_link.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool _rememberMe = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

  /*FirebaseAuth _auth = FirebaseAuth.instance;




  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            user: user,
          ),
        ),
      );
    }

    return firebaseApp;
  }*/

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
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
                      padding: EdgeInsets.only(top: 50.0),
                      child: Text(
                        'Sign In',
                        style: kTitleStyle,
                      ),
                    ),
                    _buildForm(model),
                  ],
                ))),
          ),
        ),
      ),
    );
  }

  Widget _buildForm(LoginViewModel model) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Email', style: kLabelStyle),
          TextFormField(
            controller: _emailController,
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
              border: OutlineInputBorder(),
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

          // Password
          const SizedBox(height: 10.0),
          const Text('Password', style: kLabelStyle),
          TextFormField(
            controller: _passwordController,
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
              border: OutlineInputBorder(),
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
          _buildForgotPasswordBtn(model),
          verticalSpaceSmall,
          _buildLoginBtn(model),
          _buildSignInWithText(model),
          verticalSpaceSmall,
          _buildSocialBtnRow(),
          verticalSpaceSmall,
          _buildSignupBtn(model)
        ],
      ),
    );
  }

  Widget _buildLoginBtn(LoginViewModel model) {
    return BusyButton(
      title: 'Login',
      busy: model.busy,
      onPressed: () {
        model.login(
          email: _emailController.text,
          password: _passwordController.text,
        );
      },
    );
  }

  Widget _buildForgotPasswordBtn(LoginViewModel model) {
    return Row(
      children: <Widget>[
        Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
                value: _rememberMe,
                checkColor: Colors.green,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    _rememberMe = value!;
                  });
                })),
        const Text(
          'Remember me',
          style: kLabelStyle,
        ),
        const Flexible(fit: FlexFit.tight, child: SizedBox()),
        GestureDetector(
            onTap: () {},
            child: RichText(
                text: const TextSpan(
              text: 'Forgot Password?',
              style: kLabelStyle,
            )))
      ],
    );
  }

  Widget _buildSignInWithText(LoginViewModel model) {
    return SingleChildScrollView(
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 5, top: 5),
              child: const Text(
                '- OR -',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 5),
              child: const Text(
                'Sign in with',
                style: kLabelStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignupBtn(LoginViewModel model) {
    return TextLink(
      'Create an Account if you\'re new.',
      onPressed: () {
        model.navigateToSignUp();
      },
    );
    /*Container(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(SIGNUP_SCREEN),
        child: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Don\'t have an Account? ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: 'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );*/
  }

  Widget _buildSocialBtnRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildSocialBtn(
          () async {
            //  AuthService().signInWithApple();
          },
          const AssetImage(
            'assets/icons/twitter.png',
          ),
        ),
        _buildSocialBtn(
          () async {
            //AuthService().googleLogin();
          },
          const AssetImage(
            'assets/icons/google.png',
          ),
        ),
      ],
    );
  }

  Widget _buildSocialBtn(void Function() onPressed, AssetImage logo) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  void _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              'Alert',
              style: TextStyle(
                color: Colors.red,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            content: const Text(
                'We cannot find your user accounts, considering to create new account!, do you want to create one?'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    _dismissDialog();
                   // Navigator.of(context).pushNamed(SIGNUP_SCREEN);
                  },
                  child: const Text('OK')),
            ],
          );
        });
  }

  _dismissDialog() {
    Navigator.pop(context);
  }
}
