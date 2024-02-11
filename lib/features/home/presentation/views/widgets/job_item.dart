import 'package:career_craft/colors.dart';
import 'package:career_craft/core/utils/themes.dart';
import 'package:flutter/material.dart';

class JobItem extends StatelessWidget {
  const JobItem({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.95,
      child: Card(
        elevation: 2,
        color: primary.shade400,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/abc.jpg",
                    width: size.width * 0.1,
                    height: size.height * 0.08,
                  ),
                  SizedBox(
                    width: size.width * 0.04,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ABC inc",
                        style: theme.textTheme.titleLarge,
                      ),
                      Text(
                        "  Flutter developer",
                        style: theme.textTheme.titleSmall!.copyWith(
                          color: primary.shade700,
                        ),
                      ),
                      Text(
                        "  2 years",
                        style: theme.textTheme.titleSmall!.copyWith(
                          color: primary.shade600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
