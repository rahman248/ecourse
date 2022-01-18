// Box Decorations
import 'package:flutter/material.dart';

BoxDecoration fieldDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(5), color: Colors.grey[200]);

BoxDecoration disabledFieldDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(5), color: Colors.grey[100]);

// Field Variables

const double fieldHeight = 55;
const double smallFieldHeight = 40;
const double inputFieldBottomMargin = 30;
const double inputFieldSmallBottomMargin = 0;
const EdgeInsets fieldPadding = EdgeInsets.symmetric(horizontal: 15);
const EdgeInsets largeFieldPadding =
EdgeInsets.symmetric(horizontal: 15, vertical: 15);
const double fixPadding = 10.0;

const Color primaryColor = Color(0xff000051);
const Color redColor = Color(0xfffe615c);
const Color whiteColor = Colors.white;
const Color blackColor = Colors.black;
const Color greyColor = Colors.grey;


// Text Variables
const buttonTitleTextStyle = TextStyle(
  color: Color(0xFF527DAA),
  letterSpacing: 1.5,
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'CM Sans Serif',
);

const kHintTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'CM Sans Serif',
);

const kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'CM Sans Serif',
);

const kTitleStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'CM Sans Serif',
  fontSize: 26.0,
  height: 1.5,
);

const kTitleTollbarStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'CM Sans Serif',
  fontSize: 20.0,
  height: 1.5,
);

const kSubtitleStyle = TextStyle(
  color: Colors.white,
  fontSize: 18.0,
  height: 1.2,
);


const kPrimaryColor = Color(0xFF527DAA);
const kBackButtonShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(30),
  ),
);

Color blue = Color(0xFF6E8AFA);
Color green = Color(0xFF49CC96);
Color yellow = Color(0xFFFFD073);
Color pink = Color(0xFFFFEDEE);

//Text Sytle
const kTextColor = Color(0xFF61688B);

const sytleTextTitle = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 22,
  letterSpacing: 0.27,
  color: Color(0xFF17262A)
);

const heightSpace = SizedBox(height: 5.0);
const widthSpace = SizedBox(width: 5.0);

TextStyle black27SemiBoldTextStyle = TextStyle(
  color: blackColor,
  fontSize: 27,
  fontWeight: FontWeight.w600,
);

TextStyle white22SemiBoldTextStyle = TextStyle(
  color: whiteColor,
  fontSize: 22,
  fontWeight: FontWeight.w600,
);

TextStyle primaryColor20SemiBoldTextStyle = TextStyle(
  color: primaryColor,
  fontSize: 20,
  fontWeight: FontWeight.w600,
);

TextStyle white20SemiBoldTextStyle = TextStyle(
  color: whiteColor,
  fontSize: 20,
  fontWeight: FontWeight.w600,
);

TextStyle black20SemiBoldTextStyle = TextStyle(
  color: blackColor,
  fontSize: 20,
  fontWeight: FontWeight.w600,
);

TextStyle black18BoldTextStyle = TextStyle(
  color: blackColor,
  fontSize: 18,
  fontWeight: FontWeight.w700,
);

TextStyle black18SemiBoldTextStyle = TextStyle(
  color: blackColor,
  fontSize: 18,
  fontWeight: FontWeight.w600,
);

TextStyle black18MediumTextStyle = TextStyle(
  color: blackColor,
  fontSize: 18,
  fontWeight: FontWeight.w500,
);

TextStyle black16SemiBoldTextStyle = TextStyle(
  color: blackColor,
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

TextStyle grey16MediumTextStyle = TextStyle(
  color: greyColor,
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

TextStyle grey16RegularTextStyle = TextStyle(
  color: greyColor,
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

TextStyle grey15SemiBoldTextStyle = TextStyle(
  color: greyColor,
  fontSize: 15,
  fontWeight: FontWeight.w600,
);

TextStyle black15SemiBoldTextStyle = TextStyle(
  color: blackColor,
  fontSize: 15,
  fontWeight: FontWeight.w600,
);

TextStyle black15BoldTextStyle = TextStyle(
  color: blackColor,
  fontSize: 15,
  fontWeight: FontWeight.w700,
);

TextStyle red15SemiBoldTextStyle = TextStyle(
  color: redColor,
  fontSize: 15,
  fontWeight: FontWeight.w600,
);

TextStyle grey14BoldTextStyle = TextStyle(
  color: greyColor,
  fontSize: 14,
  fontWeight: FontWeight.w700,
);

TextStyle grey14SemiBoldTextStyle = TextStyle(
  color: greyColor,
  fontSize: 14,
  fontWeight: FontWeight.w600,
);

TextStyle black14MediumTextStyle = TextStyle(
  color: blackColor,
  fontSize: 14,
  fontWeight: FontWeight.w500,
);

TextStyle primaryColor14MediumTextStyle = TextStyle(
  color: primaryColor,
  fontSize: 14,
  fontWeight: FontWeight.w500,
);

TextStyle primaryColor14SemiBoldTextStyle = TextStyle(
  color: primaryColor,
  fontSize: 14,
  fontWeight: FontWeight.w600,
);

TextStyle white14SemiBoldTextStyle = TextStyle(
  color: whiteColor,
  fontSize: 14,
  fontWeight: FontWeight.w600,
);

TextStyle grey14MediumTextStyle = TextStyle(
  color: greyColor,
  fontSize: 14,
  fontWeight: FontWeight.w500,
);

TextStyle grey14RegularTextStyle = TextStyle(
  color: greyColor,
  fontSize: 14,
  fontWeight: FontWeight.w400,
);

TextStyle black13BoldTextStyle = TextStyle(
  color: blackColor,
  fontSize: 13,
  fontWeight: FontWeight.w700,
);

TextStyle black13MediumTextStyle = TextStyle(
  color: blackColor,
  fontSize: 13,
  fontWeight: FontWeight.w500,
);

TextStyle white12SemiBoldTextStyle = TextStyle(
  color: whiteColor,
  fontSize: 12,
  fontWeight: FontWeight.w600,
);

TextStyle black12SemiBoldTextStyle = TextStyle(
  color: blackColor,
  fontSize: 12,
  fontWeight: FontWeight.w600,
);

TextStyle grey12RegularTextStyle = TextStyle(
  color: greyColor,
  fontSize: 12,
  fontWeight: FontWeight.w400,
);

TextStyle red12RegularTextStyle = TextStyle(
  color: redColor,
  fontSize: 12,
  fontWeight: FontWeight.w400,
);

TextStyle yellow11MediumTextStyle = TextStyle(
  color: Colors.yellow[800],
  fontSize: 11,
  fontWeight: FontWeight.w500,
);

TextStyle primaryColor11BoldTextStyle = TextStyle(
  color: primaryColor,
  fontSize: 11,
  fontWeight: FontWeight.w700,
);

TextStyle black11SemiBoldTextStyle = TextStyle(
  color: blackColor,
  fontSize: 11,
  fontWeight: FontWeight.w600,
);

TextStyle black11MediumTextStyle = TextStyle(
  color: blackColor,
  fontSize: 11,
  fontWeight: FontWeight.w500,
);

TextStyle grey11SemiBoldTextStyle = TextStyle(
  color: greyColor,
  fontSize: 11,
  fontWeight: FontWeight.w600,
);

TextStyle grey11MediumTextStyle = TextStyle(
  color: greyColor,
  fontSize: 11,
  fontWeight: FontWeight.w500,
);

TextStyle grey11RegularTextStyle = TextStyle(
  color: greyColor,
  fontSize: 11,
  fontWeight: FontWeight.w400,
);

TextStyle white11RegularTextStyle = TextStyle(
  color: whiteColor,
  fontSize: 11,
  fontWeight: FontWeight.w400,
);

TextStyle grey11RegularLineThroughTextStyle = TextStyle(
  decoration: TextDecoration.lineThrough,
  color: greyColor,
  fontSize: 11,
  fontWeight: FontWeight.w400,
);

TextStyle grey10RegularTextStyle = TextStyle(
  color: greyColor,
  fontSize: 10,
  fontWeight: FontWeight.w400,
);

TextStyle grey10MediumTextStyle = TextStyle(
  color: greyColor,
  fontSize: 10,
  fontWeight: FontWeight.w500,
);

TextStyle yellow10MediumTextStyle = TextStyle(
  color: Colors.yellow[800],
  fontSize: 10,
  fontWeight: FontWeight.w500,
);

TextStyle black10BoldTextStyle = TextStyle(
  color: blackColor,
  fontSize: 10,
  fontWeight: FontWeight.w700,
);

TextStyle grey10MediumLineThroughtTextStyle = TextStyle(
  decoration: TextDecoration.lineThrough,
  color: greyColor,
  fontSize: 10,
  fontWeight: FontWeight.w500,
);

TextStyle red10BoldTextStyle = TextStyle(
  color: redColor,
  fontSize: 10,
  fontWeight: FontWeight.w700,
);

TextStyle black10RegularTextStyle = TextStyle(
  color: blackColor,
  fontSize: 10,
  fontWeight: FontWeight.w400,
);

TextStyle grey9SemiBoldTextStyle = TextStyle(
  color: greyColor,
  fontSize: 9,
  fontWeight: FontWeight.w600,
);

TextStyle white8BoldTextStyle = TextStyle(
  color: whiteColor,
  fontSize: 8,
  fontWeight: FontWeight.w700,
);
