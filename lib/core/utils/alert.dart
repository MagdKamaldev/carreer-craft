import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';

void showappDialog(BuildContext context, VoidCallback onPressed,
    String title, String item, TextTheme theme) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text("${S.of(context).areYouSure} $item" " ?"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              S.of(context).cancel,
              style: theme.titleMedium!,
            ),
          ),
          TextButton(
            onPressed: () {
              onPressed();
              Navigator.of(context).pop();
            },
            child: Text(
              item,
              style: theme.titleMedium!.copyWith(color: Colors.red),
            ),
          ),
        ],
      );
    },
  );
}
