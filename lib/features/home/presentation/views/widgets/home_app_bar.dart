import 'package:career_craft/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

PreferredSizeWidget homeAppBar(
  Size size,
) =>
    AppBar(
      toolbarHeight: size.height * 0.1,
      backgroundColor: primary.shade200,
      leading: Padding(
        padding: EdgeInsets.all(size.width * 0.03),
        child: SvgPicture.asset("assets/images/drawer.svg"),
      ),
      actions: [
        SizedBox(
            height: size.height * 0.1,
            width: size.width * 0.15,
            child: SvgPicture.asset("assets/images/notifiacations.svg")),
        SizedBox(
          width: size.width * 0.06,
        ),
        SizedBox(
            height: size.height * 0.1,
            width: size.width * 0.075,
            child: SvgPicture.asset("assets/images/settings.svg")),
        SizedBox(
          width: size.width * 0.06,
        ),
      ],
    );
