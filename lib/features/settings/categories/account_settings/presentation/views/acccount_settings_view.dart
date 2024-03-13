import 'package:career_craft/features/settings/categories/account_settings/presentation/views/widgets/acconut_settings_view_body.dart';
import 'package:career_craft/core/utils/app_bars.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';

class AccountSettingsView extends StatelessWidget {
  const AccountSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingsAppBar(context, S.of(context).accountSettings),
      body: const AcconutSettingViewBody(),
    );
  }
}
