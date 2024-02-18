import 'package:career_craft/core/models/user_model.dart';
import 'package:hive/hive.dart';

class HiveFunctions {
  static void saveUserToHive(UserModel user, String boxName) {
    var box = Hive.box(boxName);
    box.addAll([user]);
  }

  static UserModel getUserFromHive(String boxName) {
    var box = Hive.box<UserModel>(boxName);
    return box.getAt(0)!;
  }
}
