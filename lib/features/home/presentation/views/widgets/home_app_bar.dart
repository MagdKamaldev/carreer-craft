import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/features/settings/presentation/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

PreferredSizeWidget homeAppBar(
  Size size,
  BuildContext context,
  GlobalKey<ScaffoldState> scaffoldKey,
) =>
    AppBar(
      toolbarHeight: size.height * 0.1,
      backgroundColor: primary.shade200,
      leading: Padding(
        padding: EdgeInsets.all(size.width * 0.03),
        child: GestureDetector(
            onTap: () {
              scaffoldKey.currentState!.openDrawer();
            },
            child: SvgPicture.asset("assets/images/drawer.svg")),
      ),
      actions: [
        SizedBox(
            height: size.height * 0.1,
            width: size.width * 0.15,
            child: SvgPicture.asset("assets/images/notifiacations.svg")),
        SizedBox(
          width: size.width * 0.06,
        ),
        GestureDetector(
          onTap: () {
            navigateTo(context, const SettingsView());
          },
          child: SizedBox(
            height: size.height * 0.1,
            width: size.width * 0.075,
            child: SvgPicture.asset(
              "assets/images/settings.svg",
            ),
          ),
        ),
        SizedBox(
          width: size.width * 0.06,
        ),
      ],
    );
