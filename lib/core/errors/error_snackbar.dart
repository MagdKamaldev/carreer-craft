import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void showErrorSnackbar(
    {required BuildContext context,
    required String title,
    required String body,
    void Function()? actionPressed,
    String actionText = ""}) {
  Size size = MediaQuery.of(context).size;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      //duration: const Duration(seconds: 10),
      backgroundColor: primary.shade200,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset("assets/images/warning.svg"),
              SizedBox(
                width: size.width * 0.04,
              ),
              SizedBox(
                width: size.width * 0.03,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(height: size.height * 0.01),
                  SizedBox(
                    width: size.width * 0.6,
                    child: Text(
                      body,
                      overflow: TextOverflow.visible,
                      maxLines: 3,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  TextButton(
                      onPressed: actionPressed,
                      child: Text(
                        actionText,
                        style: theme.textTheme.titleSmall!.copyWith(
                            color: secondary, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                  icon: Icon(
                    Icons.close,
                    color: primary.shade400,
                  ))
            ],
          ),
        ],
      ),
    ),
  );
}
