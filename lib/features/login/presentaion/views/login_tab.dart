import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/utils/app_router.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/core/utils/service_locator.dart';
import 'package:career_craft/features/login/data/repositories/login_repository_implementation.dart';
import 'package:career_craft/features/login/presentaion/manager/login_cubit/login_cubit.dart';
import 'package:career_craft/features/login/presentaion/views/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class LoginTab extends StatelessWidget {
  const LoginTab({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme theme = Theme.of(context).textTheme;
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocProvider(
        create: (context) => LoginCubit(
              getIt<LoginRepositoryImplementation>(),
            ),
        child: BlocBuilder<LoginCubit, LoginStates>(
          builder: (context, state) => SingleChildScrollView(
            child: Form(
              key: formKey,
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
                            suffix: LoginCubit.get(context).suffix,
                            isPassword: LoginCubit.get(context).isPassword,
                            suffixPressed: () {
                              LoginCubit.get(context).changePassword();
                            },
                            validate: (String value) {
                              if (value.isEmpty) {
                                return "Password must not be empty";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: size.height * 0.03),
                          LoginButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                LoginCubit.get(context).login(
                                    emailcontroller.text,
                                    passwordcontroller.text);
                              }
                            },
                          )
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
                      style: theme.bodyMedium!.copyWith(
                          color: secondary, fontWeight: FontWeight.bold),
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
                        style:
                            theme.bodyMedium!.copyWith(color: primary.shade600),
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
            ),
          ),
        ));
  }
}
