import 'package:easecar/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TextStyleCustom {
  static TextStyle titleStyle = const TextStyle(
    fontSize: 30,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontFamily: 'Rubik',
  );

  static TextStyle subtitleStyle = const TextStyle(
    fontSize: 20,
    color: AppColors.white,
    fontWeight: FontWeight.w600,
    fontFamily: 'Rubik',
  );

  static TextStyle subtitleLoginStyle = const TextStyle(
    fontSize: 16,
    color: AppColors.white,
    fontWeight: FontWeight.w600,
    fontFamily: 'Rubik',
  );

  static TextStyle titleFormFieldStyle = const TextStyle(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.normal,
    fontFamily: 'Rubik',
  );

  static TextStyle subtitleStyleTwo = const TextStyle(
    fontSize: 14,
    color: Color(0xffAAC3D0),
    fontWeight: FontWeight.normal,
    fontFamily: 'Rubik',
  );

  static TextStyle textButtonPrimary = const TextStyle(
    fontSize: 16,
    color: Color(0xff0455A8),
    fontWeight: FontWeight.w600,
    fontFamily: 'Rubik',
  );

  static TextStyle textButtonSecondary = const TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontFamily: 'Rubik',
  );

  static TextStyle errorTextFormFieldStyle = const TextStyle(
    fontSize: 12,
    color: Color.fromARGB(255, 252, 161, 128),
    fontWeight: FontWeight.normal,
    fontFamily: 'Rubik',
  );

  static TextStyle titleDefault = const TextStyle(
    fontSize: 9.0,
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontFamily: 'Rubik',
  );
}
