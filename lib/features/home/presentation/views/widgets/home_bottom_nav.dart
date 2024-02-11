import 'package:career_craft/colors.dart';
import 'package:career_craft/core/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget homeBottomNav() => BottomNavigationBar(
      selectedLabelStyle: theme.textTheme.titleSmall,
      selectedItemColor: primary,
      items: [
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset("assets/images/Briefcase.svg"),
            ),
            label: "Jobs"),
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset("assets/images/news.svg"),
            ),
            label: "News"),
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset("assets/images/User.svg"),
            ),
            label: "Profile")
      ],
    );
