import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/utils/functions/logout.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme theme = Theme.of(context).textTheme;
    return Drawer(
      backgroundColor: primary[200],
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05,
        ),
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  SizedBox(
                      height: size.height * 0.1,
                      width: size.width * 0.15,
                      child: SvgPicture.asset("assets/images/logo.svg")),
                  Text(S.of(context).appName),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.05),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        S.of(context).settings,
                        style: theme.bodyLarge,
                      ),
                      const Spacer(),
                      SvgPicture.asset("assets/images/settings.svg")
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Row(
                    children: [
                      Text(
                        S.of(context).logout,
                        style: theme.bodyLarge,
                      ),
                      const Spacer(),
                      SvgPicture.asset("assets/images/Logout.svg")
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
