import 'package:career_craft/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget settingsItem(
        Size size, TextTheme theme, String iconName, String title) =>
    Column(
      children: [
        Row(
          children: [
            SizedBox(
                width: size.width * 0.1, child: SvgPicture.asset(iconName)),
            SizedBox(
              width: size.width * 0.05,
            ),
            Text(
              title,
              style: theme.bodyLarge,
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: size.width * 0.045,
              color: primary[500],
            )
          ],
        ),
        SizedBox(
          height: size.height * 0.016,
        ),
        Container(
          width: double.infinity,
          height: 0.5,
          color: primary[500],
        )
      ],
    );
