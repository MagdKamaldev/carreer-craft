import 'package:flutter/material.dart';

PreferredSizeWidget settingsAppBar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    toolbarHeight: MediaQuery.of(context).size.height * 0.1,
    centerTitle: true,
    title: Text(
      title,
      style: Theme.of(context).textTheme.titleLarge,
    ),
  );
}

PreferredSizeWidget companyAppBar(
    BuildContext context, String title, List<Widget>? actions) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    toolbarHeight: MediaQuery.of(context).size.height * 0.1,
    centerTitle: true,
    title: Text(
      title,
      style: Theme.of(context).textTheme.titleLarge,
    ),
    actions: actions,
  );
}
