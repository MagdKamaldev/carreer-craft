import 'package:flutter/material.dart';

class SkillsList extends StatelessWidget {
  final List<dynamic> skills;
  final TextTheme theme;

  const SkillsList({
    super.key,
    required this.skills,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.05 * skills.length.toDouble(),
      child: ListView.separated(
        separatorBuilder: (context, index) =>
            SizedBox(height: size.height * 0.01),
        itemCount: skills.length,
        itemBuilder: (context, index) => Text(
          skills[index],
          style: theme.titleSmall!.copyWith(color: Colors.grey[300]),
        ),
      ),
    );
  }
}
