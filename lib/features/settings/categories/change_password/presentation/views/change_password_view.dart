import 'package:career_craft/features/settings/categories/change_password/presentation/views/widgets/change_password_view_body.dart';
import 'package:career_craft/features/settings/presentation/views/widgets/settings_app_bar.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingsAppBar(context, S.of(context).changePassword),
      body: const ChangePasswordViewBody(),
    );
  }
}
