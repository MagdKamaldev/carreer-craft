import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/errors/error_snackbar.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/core/utils/service_locator.dart';
import 'package:career_craft/features/forgotPassword/data/repositories/forgot_password_repository_implementation.dart';
import 'package:career_craft/features/forgotPassword/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:career_craft/features/forgotPassword/presentation/views/widgets/reset_password_button.dart';
import 'package:career_craft/features/home/presentation/views/home_view.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            navigateAndFinish(context, const HomeView());
            showErrorSnackbar(
                context: context,
                icon: "assets/images/true.svg",
                title: S.of(context).success,
                body: S.of(context).passwordChanged);
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
                      S.of(context).confirmNewPass,
                      style: theme.titleLarge,
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Text(
                      S.of(context).confirmNewPassText,
                      style:
                          theme.bodyMedium!.copyWith(color: primary.shade500),
                    ),
                    SizedBox(
                      height: size.height * .08,
                    ),
                    defaultTextField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        label: S.of(context).email,
                        theme: theme,
                        context: context,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return S.of(context).emptyValidation;
                          }
                        }),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    defaultTextField(
                        controller: confirmPasswordController,
                        type: TextInputType.emailAddress,
                        label: S.of(context).password,
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
                            return S.of(context).emptyValidation;
                          }
                        }),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    defaultTextField(
                        controller: passwordController,
                        type: TextInputType.emailAddress,
                        label: S.of(context).confirmPassword,
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
                            return S.of(context).emptyValidation;
                          } else if (value != confirmPasswordController.text) {
                            return S.of(context).confirmpasValidation;
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
