import 'package:career_craft/core/colors.dart';
import 'package:flutter/material.dart';

class CompanyInfoItem extends StatelessWidget {
  final String value;
  final String title;
  final Color labelColor;
  final Color valueColor;
  final Size size;
  final TextTheme theme;

  const CompanyInfoItem({
    super.key,
    required this.value,
    required this.title,
    required this.labelColor,
    required this.valueColor,
    required this.size,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 2.0,
        color: secondary[100],
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: secondary[600]!,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(size.height * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: theme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: labelColor,
                  ),
                ),
                Text(
                  value,
                  style: theme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: valueColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
