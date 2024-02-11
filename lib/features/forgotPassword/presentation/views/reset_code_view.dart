import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/features/forgotPassword/presentation/views/widgets/reset_code_body.dart';
import 'package:flutter/material.dart';

class ResetCodeView extends StatelessWidget {
  const ResetCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context),
      body: const ResetCodeViewBody(),
    );
  }
}
