import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget settingsAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    toolbarHeight: MediaQuery.of(context).size.height * 0.1,
    centerTitle: true,
    title: Text(
      S.of(context).settings,
      style: Theme.of(context).textTheme.titleLarge,
    ),
  );
}
