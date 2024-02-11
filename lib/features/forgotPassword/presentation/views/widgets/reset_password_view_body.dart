import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/utils/app_router.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    Size size = MediaQuery.of(context).size;
    TextTheme theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * .08,
            ),
            Text(
              "Confirm new Password",
              style: theme.titleLarge,
            ),
            SizedBox(
              height: size.height * .02,
            ),
            Text(
              "Enter your Password to reset it !",
              style: theme.bodyMedium!.copyWith(color: primary.shade500),
            ),
            SizedBox(
              height: size.height * .08,
            ),
            defaultTextField(
                controller: emailController,
                type: TextInputType.emailAddress,
                label: "Email",
                theme: theme,
                context: context,
                validate: (String value) {
                  if (value.isEmpty) {
                    return "field must not be empty";
                  }
                }),
            SizedBox(
              height: size.height * .02,
            ),
            defaultTextField(
                controller: passwordController,
                type: TextInputType.emailAddress,
                label: "Password",
                theme: theme,
                context: context,
                suffix: Icons.remove_red_eye,
                validate: (String value) {
                  if (value.isEmpty) {
                    return "field must not be empty";
                  }
                }),
            SizedBox(
              height: size.height * .02,
            ),
            defaultTextField(
                controller: confirmPasswordController,
                type: TextInputType.emailAddress,
                label: "Password",
                theme: theme,
                context: context,
                suffix: Icons.remove_red_eye,
                validate: (String value) {
                  if (value.isEmpty) {
                    return "field must not be empty";
                  }
                }),
            SizedBox(
              height: size.height * .15,
            ),
            defaultButton(
                function: () {
                  GoRouter.of(context).push(AppRouter.homeView);
                },
                context: context,
                text: "Confirm Password"),
          ],
        ),
      ),
    );
  }
}
