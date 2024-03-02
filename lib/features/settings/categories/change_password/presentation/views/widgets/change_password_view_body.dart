import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/errors/error_snackbar.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/core/utils/service_locator.dart';
import 'package:career_craft/features/profile/data/repositories/profile_repository_implementation.dart';
import 'package:career_craft/features/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:career_craft/features/settings/categories/change_password/presentation/views/widgets/change_password_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../generated/l10n.dart';

class ChangePasswordViewBody extends StatelessWidget {
  const ChangePasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController oldPasswordController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    Size size = MediaQuery.of(context).size;
    TextTheme theme = Theme.of(context).textTheme;
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => UserCubit(
        getIt<ProfileRepositoryImplementation>(),
      ),
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is ResetPasswordLoaded) {
            Navigator.pop(context);
            showErrorSnackbar(
                context: context,
                icon: "assets/images/true.svg",
                title: S.of(context).success,
                body: S.of(context).passwordChanged);
          } else if (state is ResetPasswordError) {
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
                        controller: oldPasswordController,
                        type: TextInputType.visiblePassword,
                        label: S.of(context).currentPassword,
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
                        type: TextInputType.visiblePassword,
                        label: S.of(context).newPassword,
                        theme: theme,
                        context: context,
                        suffix: UserCubit.get(context).passwordSuffix,
                        isPassword: UserCubit.get(context).passwordIsPassword,
                        suffixPressed: () {
                          UserCubit.get(context).changePassword();
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
                        isPassword: UserCubit.get(context).confirmIsPassword,
                        suffix: UserCubit.get(context).confirmSuffix,
                        suffixPressed: () {
                          UserCubit.get(context).changeConfirm();
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
                    ChangePasswordButton(onPressed: () {
                      if (formKey.currentState!.validate()) {
                        UserCubit.get(context).resetPassword(
                          newPassword: passwordController.text,
                          currentPassword: oldPasswordController.text,
                          confirmPassword: confirmPasswordController.text,
                        );
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
