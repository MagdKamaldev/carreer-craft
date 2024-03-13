import 'package:career_craft/core/utils/app_bars.dart';
import 'package:career_craft/features/settings/presentation/views/widgets/settings_view_body.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingsAppBar(context, S.of(context).settings),
      body: const SettingsViewBody(),
    );
  }
}
