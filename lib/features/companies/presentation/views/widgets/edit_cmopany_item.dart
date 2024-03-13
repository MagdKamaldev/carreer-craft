import 'package:flutter/material.dart';

import '../../../../../core/colors.dart';

Widget editCompanyItem(
        Size size, TextTheme theme, String title, void Function() onPressed) =>
    GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Row(
            children: [
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
      ),
    );
