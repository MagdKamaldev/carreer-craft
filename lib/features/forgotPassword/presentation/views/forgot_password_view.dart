import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/features/forgotPassword/presentation/views/widgets/forgot_password_view_body.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: defaultAppBar(context), body: const ForgotPasswordViewBody());
  }
}
