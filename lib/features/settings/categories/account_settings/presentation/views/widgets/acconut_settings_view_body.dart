import 'package:career_craft/core/constants.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/core/utils/service_locator.dart';
import 'package:career_craft/features/profile/data/repositories/profile_repository_implementation.dart';
import 'package:career_craft/features/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:career_craft/features/settings/categories/account_settings/presentation/views/widgets/date_widget.dart';
import 'package:career_craft/features/settings/categories/account_settings/presentation/views/widgets/update_account_button.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AcconutSettingViewBody extends StatelessWidget {
  const AcconutSettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController recoveryEmailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController bioController = TextEditingController();
    TextTheme theme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) =>
          UserCubit(getIt<ProfileRepositoryImplementation>())..getUser(),
      child: BlocConsumer<UserCubit, UserState>(listener: (context, state) {
        if (state is UserLoaded) {
          emailcontroller.text = state.user.email!;
          recoveryEmailcontroller.text = state.user.recoveryEmail!;
          firstNameController.text = state.user.firstName!;
          lastNameController.text = state.user.lastName!;
          bioController.text = state.user.bio!;
        }
      }, builder: (context, state) {
        if (state is UserLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.06,
                    ),
                    SizedBox(
                      width: size.width * 0.9,
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.42,
                            child: defaultTextField(
                                controller: firstNameController,
                                type: TextInputType.name,
                                label: S.of(context).firstName,
                                theme: theme,
                                context: context,
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return S.of(context).emptyValidation;
                                  }
                                }),
                          ),
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          SizedBox(
                            width: size.width * 0.42,
                            child: defaultTextField(
                                controller: lastNameController,
                                type: TextInputType.name,
                                label: S.of(context).lastName,
                                theme: theme,
                                context: context,
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return S.of(context).emptyValidation;
                                  }
                                }),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    defaultTextField(
                        controller: emailcontroller,
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
                      height: size.height * 0.02,
                    ),
                    defaultTextField(
                        controller: recoveryEmailcontroller,
                        type: TextInputType.emailAddress,
                        label: S.of(context).recoveryEmail,
                        theme: theme,
                        context: context,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return S.of(context).emptyValidation;
                          }
                        }),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    defaultTextField(
                        controller: bioController,
                        type: TextInputType.name,
                        label: S.of(context).Bio,
                        theme: theme,
                        context: context,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return S.of(context).emptyValidation;
                          }
                        }),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    defaultTextField(
                        controller: passwordcontroller,
                        type: TextInputType.visiblePassword,
                        label: S.of(context).password,
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
                      height: size.height * 0.02,
                    ),
                    const UpdateUserDateWidget(),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    UpdateAccountButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          UserCubit.get(context).updateProfile(
                            recoveryEmail: recoveryEmailcontroller.text,
                            token: token!,
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            bio: bioController.text,
                            email: emailcontroller.text,
                            password: passwordcontroller.text,
                            dob:
                                "${UserCubit.get(context).yearController.text}-${UserCubit.get(context).monthController.text}-${UserCubit.get(context).dayController.text}",
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      }),
    );
  }
}
