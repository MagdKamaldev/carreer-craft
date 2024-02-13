import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/errors/error_snackbar.dart';
import 'package:career_craft/core/utils/app_router.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/core/utils/service_locator.dart';
import 'package:career_craft/features/forgotPassword/data/repositories/forgot_password_repository_implementation.dart';
import 'package:career_craft/features/forgotPassword/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:career_craft/features/forgotPassword/presentation/views/widgets/reset_password_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(
        getIt<ForgotPasswordRepositoryImplementation>(),
      ),
      child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if (state is ChangePasswordSuccessState) {
            GoRouter.of(context).push(AppRouter.homeView);
            showErrorSnackbar(
                context: context,
                icon: "assets/images/true.svg",
                title: "Success",
                body: "Your Password has been Successfully Changed");
          } else if (state is ChangePasswordFailureState) {
            showErrorSnackbar(
                context: context, title: "Error", body: state.message);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              key: formKey,
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
                      style:
                          theme.bodyMedium!.copyWith(color: primary.shade500),
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
                        controller: confirmPasswordController,
                        type: TextInputType.emailAddress,
                        label: "Password",
                        theme: theme,
                        context: context,
                        suffix: ForgotPasswordCubit.get(context).passwordSuffix,
                        isPassword:
                            ForgotPasswordCubit.get(context).passwordIsPassword,
                        suffixPressed: () {
                          ForgotPasswordCubit.get(context)
                              .changePasswordVisibility();
                        },
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
                        label: "Confirm Password",
                        theme: theme,
                        context: context,
                        isPassword:
                            ForgotPasswordCubit.get(context).confirmIsPassword,
                        suffix: ForgotPasswordCubit.get(context).confirmSuffix,
                        suffixPressed: () {
                          ForgotPasswordCubit.get(context)
                              .changeConfirmVisibility();
                        },
                        validate: (String value) {
                          if (value.isEmpty) {
                            return "field must not be empty";
                          } else if (value != confirmPasswordController.text) {
                            return "Passwords does not match";
                          }
                        }),
                    SizedBox(
                      height: size.height * .15,
                    ),
                    ResetPasswordButton(onPressed: () {
                      if (formKey.currentState!.validate()) {
                        ForgotPasswordCubit.get(context).changePassword(
                            email: emailController.text,
                            password: passwordController.text,
                            confirmPassword: confirmPasswordController.text);
                      }
                    }),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
