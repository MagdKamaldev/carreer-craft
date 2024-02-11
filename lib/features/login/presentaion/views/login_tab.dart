import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/utils/app_router.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class LoginTab extends StatelessWidget {
  const LoginTab({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    Size size = MediaQuery.of(context).size;
    TextTheme theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.06,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  defaultTextField(
                      controller: emailcontroller,
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
                    height: size.height * 0.02,
                  ),
                  defaultTextField(
                    controller: passwordcontroller,
                    type: TextInputType.visiblePassword,
                    label: "password",
                    theme: theme,
                    context: context,
                    suffix: Icons.remove_red_eye,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return "Password must not be empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: size.height * 0.03),
                  defaultButton(
                    function: () {
                      GoRouter.of(context).pushReplacement(AppRouter.homeView);
                    },
                    context: context,
                    text: "Sign in",
                    height: size.height * 0.06,
                  ),
                ],
              )),
          SizedBox(
            height: size.height * 0.04,
          ),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRouter.forgotPasswordView);
            },
            child: Text(
              "Forgot password",
              style: theme.bodyMedium!
                  .copyWith(color: secondary, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          Row(
            children: [
              SizedBox(
                width: size.width * 0.05,
              ),
              Container(
                height: 1,
                width: size.width * 0.296,
                color: primary.shade600,
              ),
              SizedBox(
                width: size.width * 0.03,
              ),
              Text(
                "Or better yet...",
                style: theme.bodyMedium!.copyWith(color: primary.shade600),
              ),
              SizedBox(
                width: size.width * 0.03,
              ),
              Container(
                height: 1,
                width: size.width * 0.296,
                color: primary.shade600,
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.06,
          ),
          SvgPicture.asset("assets/images/google-button.svg"),
          SizedBox(
            height: size.height * 0.04,
          ),
          SvgPicture.asset("assets/images/facebook-button.svg"),
          SizedBox(
            height: size.height * 0.04,
          ),
          Text(
            "By creating an account, you accept our ",
            style: theme.bodyMedium,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.clip,
          ),
          Text(
            " Terms and conditions",
            maxLines: 2,
            style: theme.bodyMedium!.copyWith(
              color: secondary,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
        ],
      ),
    );
  }
}
