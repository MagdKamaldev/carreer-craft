import 'package:career_craft/core/constants.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/features/entrance/presentation/views/entrance_view.dart';

void logout(context) {
  navigateAndFinish(context, const EntranceView());
  kTokenBox.put(kTokenBoxString, "");
}
