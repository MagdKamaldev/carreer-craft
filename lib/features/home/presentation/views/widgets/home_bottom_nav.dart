import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget homeBottomNav() => BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset("assets/images/Home.svg"),
            ),
            label: "Home"),
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset("assets/images/Briefcase.svg"),
            ),
            label: "Jobs"),
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset("assets/images/User.svg"),
            ),
            label: "Profile")
      ],
    );
