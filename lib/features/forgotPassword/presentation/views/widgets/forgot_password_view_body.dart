import 'package:career_craft/colors.dart';
import 'package:career_craft/core/utils/app_router.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextTheme theme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * .08,
            ),
            Text(
              "Forgot Password",
              style: theme.titleLarge,
            ),
            SizedBox(
              height: size.height * .02,
            ),
            Text(
              "Please enter your Email Adress!",
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
                    return "Email must not be empty";
                  }
                  return null;
                }),
            SizedBox(
              height: size.height * .08,
            ),
            Text(
              "We’ll send you a code, it help us keep your account secure.",
              style: theme.bodyMedium!.copyWith(color: primary.shade500),
            ),
            SizedBox(
              height: size.height * .15,
            ),
            defaultButton(
                function: () {
                  GoRouter.of(context).push(AppRouter.resetCodeView);
                },
                context: context,
                text: "Send Code")
          ],
        ),
      ),
    );
  }
}
