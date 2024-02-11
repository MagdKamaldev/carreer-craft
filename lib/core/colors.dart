import 'package:flutter/material.dart';

const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
  50: Color(0xFFF8F8FF),
  100: Color(0xFFF2F1FA),
  200: Color(0xFFE1E0F1),
  300: Color(0xFFC7C5DE),
  400: Color(0xFFAEACCA),
  500: Color(0xFF8885AC),
  600: Color(0xFF64618A),
  700: Color(0xFF484473),
  800: Color(0xFF231E58),
  900: Color(_primaryPrimaryValue),
});
 const int _primaryPrimaryValue = 0xFF15104D;

const MaterialColor secondary = MaterialColor(_secondaryPrimaryValue, <int, Color>{
  50: Color(0xFFEDEBFF),
  100: Color(0xFFE3E1FF),
  200: Color(0xFFC6C0FF),
  300: Color(0xFF4635FF),
  400: Color(0xFF3F30E6),
  500: Color(_secondaryPrimaryValue),
  600: Color(0xFF3528BF),
  700: Color(0xFF2A2099),
  800: Color(0xFF1F1873),
  900: Color(0xFF191359),     
});
  const int _secondaryPrimaryValue = 0xFF382ACC;