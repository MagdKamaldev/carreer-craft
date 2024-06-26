import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/features/profile/presentation/views/widgets/profile_picture.dart';
import 'package:career_craft/features/settings/presentation/views/widgets/profile_settings.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProfileNavigator extends StatelessWidget {
  const ProfileNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme theme = Theme.of(context).textTheme;
    return Row(
      children: [
        const ProfilePicture(radius: 35, bigRadius: 36),
        SizedBox(
          width: size.width * 0.03,
        ),
        Column(
          children: [
            Text(
              S.of(context).welcomeText,
              style: theme.titleMedium,
            ),
            SizedBox(
              height: size.height * 0.005,
            ),
            GestureDetector(
              onTap: () {
                navigateTo(context, const SettingsProfile());
              },
              child: Row(
                children: [
                  Text(
                    S.of(context).profile,
                    style: theme.bodyLarge!.copyWith(color: primary[500]),
                  ),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: size.width * 0.045,
                    color: primary[500],
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
