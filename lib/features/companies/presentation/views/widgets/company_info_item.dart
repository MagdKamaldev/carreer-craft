import 'package:career_craft/core/colors.dart';
import 'package:flutter/material.dart';

class CompanyInfoItem extends StatelessWidget {
  final String label;
  final String value;
  final Color labelColor;
  final Color valueColor;
  final Size size;
  final TextTheme theme;

  const CompanyInfoItem({
    super.key,
    required this.label,
    required this.value,
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
                Text(label,
                    style: theme.titleMedium!.copyWith(
                      color: secondary[600],
                    )),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  value,
                  style: theme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
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
