import 'package:flutter/material.dart';

final String FallbackImage = 'assets/images/food.png';
final String FallbackDiscountImage = 'assets/images/food/offer/discount3.png';
final Color kPrimaryColor = Color(0xFF53B175);
final Color kShadowColor = Color(0xFFA8A8A8);
final Color kBlackColor = Color(0xFF181725);
final Color kSubtitleColor = Color(0xFF7C7C7C);
final Color kSecondaryColor = Color(0xFFF2F3F2);
final Color kBorderColor = Color(0xFFE2E2E2);

final TextStyle kTitleStyle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold,
  color: kBlackColor,
);
final TextStyle kTitleLargeStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
  color: kBlackColor,
);
final TextStyle kDescriptionStyle2 = TextStyle(
  fontSize: 15,
  color: kBlackColor,
);
final TextStyle kDescriptionStyle = TextStyle(
  color: kSubtitleColor,
  fontSize: 13,
);

///common color for placeholder
const kGreyShade1 = Color(0xFF8E8E93);
const kGreyShade2 = Color(0xFFAEAEB2);
const kGreyShade3 = Color(0xFFC7C7CC);
const kGreyShade4 = Color(0xFFD1D1D6);
const kGreyShade5 = Color(0xFFE5E5EA);
const kGreyShade6 = Color(0xFFF2F2F7);
const kSeperatorColor = Color(0xFFC6C6C8);
const kGradientColor = Color(0xFF22292E);
const kFillColorPrimary = Color(0xFFE4E4E6);
const kFillColorAccent = Color(0xFFE9E9EB);
const kFillColorThird = Color(0xFFEFEFF0);
const kFillColorForth = Color(0xFFF4F4F5);
const kAlertColor = Color(0xFFFF3B30);
const kFailColor = Color(0xFFFF4343);

///Text color
const kTextColor = Color(0xFF22292E);
const kTextColorAccent = Color(0xFF8A8A8E);
const kTextColorThird = Color(0xFFC5C5C7);
const kTextColorForth = Color(0xFFF8F8F8);

/// Main color pallete
const kPrimaryGreen = Color.fromARGB(255, 74, 174, 111);
const kPrimaryRed = Color(0xFFFE6E4C);
const kPrimaryYellow = Color(0xFFFEBF43);
const kPrimaryPurple = Color(0xFF9B81E5);
const kPrimaryTosca = Color.fromARGB(255, 11, 186, 181);
const kPrimaryWhite = Color(0xFFFFFFFF);
const kAccentGreen = Color(0xFFE4F3EA);
const kAccentRed = Color(0xFFFFECE8);
const kAccentYellow = Color(0xFFFFF6E4);
const kAccentPurple = Color(0xFFF1EDFC);
const kAccentTosca = Color(0xFFDDF5F4);

class MQuery {
  static late double width;
  static late double height;

  void init(BuildContext context) {
    final MediaQueryData _mediaQueryData = MediaQuery.of(context);
    width = _mediaQueryData.size.width;
    height = _mediaQueryData.size.height;
  }
}
