import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/features/settings/categories/account_settings/presentation/views/acccount_settings_view.dart';
import 'package:career_craft/features/settings/presentation/views/widgets/profile_navigator.dart';
import 'package:career_craft/features/settings/presentation/views/widgets/settings_item.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../categories/change_password/presentation/views/change_password_view.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileNavigator(),
            SizedBox(
              height: size.height * 0.06,
            ),
            Text(
              S.of(context).preferences,
              style: theme.titleMedium!.copyWith(
                color: primary[500],
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            GestureDetector(
              onTap: () {
                navigateTo(context, const AccountSettingsView());
              },
              child: settingsItem(size, theme, "assets/images/User.svg",
                  S.of(context).accountSettings),
            ),
            SizedBox(
              height: size.height * 0.035,
            ),
            GestureDetector(
              onTap: () {
                navigateTo(context, const ChangePasswordView());
              },
              child: settingsItem(size, theme, "assets/images/Key.svg",
                  S.of(context).changePassword),
            ),
            SizedBox(
              height: size.height * 0.035,
            ),
            settingsItem(size, theme, "assets/images/bell.svg",
                S.of(context).notifications),
            SizedBox(
              height: size.height * 0.035,
            ),
            settingsItem(size, theme, "assets/images/language.svg",
                S.of(context).language),
            SizedBox(
              height: size.height * 0.06,
            ),
            Text(
              S.of(context).resources,
              style: theme.titleMedium!.copyWith(
                color: primary[500],
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            settingsItem(size, theme, "assets/images/Chat.svg",
                S.of(context).contactSupport),
            SizedBox(
              height: size.height * 0.035,
            ),
            settingsItem(
                size, theme, "assets/images/Star.svg", S.of(context).RateUs),
            SizedBox(
              height: size.height * 0.035,
            ),
            settingsItem(
                size, theme, "assets/images/Logout.svg", S.of(context).logout),
            SizedBox(
              height: size.height * 0.06,
            ),
            SizedBox(
                height: size.height * 0.2,
                child: SvgPicture.asset("assets/images/logo.svg")),
            Align(
              alignment: Alignment.center,
              child: Text(
                S.of(context).appName,
                style: theme.titleLarge,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "v1.0.0",
                style: theme.titleSmall!.copyWith(
                  color: primary[500],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
