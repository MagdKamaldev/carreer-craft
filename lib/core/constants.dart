// ignore_for_file: deprecated_member_use
import 'package:hive/hive.dart';

const transitionDuration = Duration(milliseconds: 300);
String? token = "";
String? id = "";
var kTokenBox = Hive.box(kTokenBoxString);
var kIdBox = Hive.box(kIdBoxString);
const kTokenBoxString = "token";
const kIdBoxString = "id";
