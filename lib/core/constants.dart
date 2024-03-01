// ignore_for_file: deprecated_member_use
import 'package:hive/hive.dart';

const transitionDuration = Duration(milliseconds: 300);
String? token = "";
var kTokenBox = Hive.box(kTokenBoxString);
const kTokenBoxString = "token";
