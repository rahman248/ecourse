import 'package:flutter/material.dart';

String SPLASH_SCREEN = 'SPLASH_SCREEN';
String ONBOARDING_SCREEN = 'ONBOARDING_SCREEN';
String LOGIN_SCREEN = 'LOGIN_SCREEN';
String SIGNUP_SCREEN = 'SIGNUP_SCREEN';
String NAV_SCREEN = 'NAV_SCREEN';


//menu

String HOME = 'Home';


const _kFontFam = 'eCourse';
const String? _kFontPkg = null;

const Color kBackground = Color(0xFFFCFCFC);
const Color kPrimaryLight = Color(0xFFEDF6F3);
const Color kPrimary = Color(0xFFDAEFE8);
const Color kPrimaryDark = Color(0xFF88A1AE);
const Color kAccent = Color(0xFFFDCA73);
const Color kFont = Color(0xFF252435);
const Color kFontLight = Color(0xFFB4B7BF);
const IconData calendar_full = IconData(0xe836, fontFamily: _kFontFam, fontPackage: _kFontPkg);


const kTextColor = Color(0xFF0D1333);
const kBlueColor = Color(0xFF6E8AFA);
const kBestSellerColor = Color(0xFFFFD073);
const kGreenColor = Color(0xFF49CC96);

const kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

const kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: const Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: const [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

const kTitleStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'CM Sans Serif',
  fontSize: 26.0,
  height: 1.5,
);

const kSubtitleStyle = TextStyle(
  color: Colors.white,
  fontSize: 18.0,
  height: 1.2,
);

ButtonStyle btnStyle = ElevatedButton.styleFrom(
    elevation: 5.0,
    padding: const EdgeInsets.all(15.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    primary: Colors.white);


const kHeadingextStyle = TextStyle(
  fontSize: 28,
  color: kTextColor,
  fontWeight: FontWeight.bold,
);
const kSubheadingextStyle = TextStyle(
  fontSize: 24,
  color: Color(0xFF61688B),
  height: 2,
);

const kTitleTextStyle = TextStyle(
  fontSize: 20,
  color: kTextColor,
  fontWeight: FontWeight.bold,
);

const kSubtitleTextSyule = TextStyle(
  fontSize: 18,
  color: kTextColor,
  // fontWeight: FontWeight.bold,
);

// Form Error
final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
