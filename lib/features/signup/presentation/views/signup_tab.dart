import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/core/utils/service_locator.dart';
import 'package:career_craft/features/signup/data/repositories/sign_up_repository_implementation.dart';
import 'package:career_craft/features/signup/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:career_craft/features/signup/presentation/views/widgets/date_widget.dart';
import 'package:career_craft/features/signup/presentation/views/widgets/planning_to_hire.dart';
import 'package:career_craft/features/signup/presentation/views/widgets/sign_up_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpTab extends StatelessWidget {
  const SignUpTab({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    TextEditingController confirmPasswordcontroller = TextEditingController();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextTheme theme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => SignUpCubit(getIt<SignUpRepositoryImplementation>()),
      child: BlocBuilder<SignUpCubit, SignUpState>(
        builder: (context, state) => SingleChildScrollView(
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
                              label: "First Name",
                              theme: theme,
                              context: context,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return "field must not be empty";
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
                              label: "Last Name",
                              theme: theme,
                              context: context,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return "field must not be empty";
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
                      label: "Email",
                      theme: theme,
                      context: context,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return "field must not be empty";
                        }
                      }),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  defaultTextField(
                      controller: phoneController,
                      type: TextInputType.emailAddress,
                      label: "Phone number",
                      theme: theme,
                      context: context,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return "field must not be empty";
                        }
                      }),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  defaultTextField(
                      controller: passwordcontroller,
                      type: TextInputType.visiblePassword,
                      label: "Password",
                      theme: theme,
                      context: context,
                      suffix: SignUpCubit.get(context).passwordSuffix,
                      isPassword: SignUpCubit.get(context).passwordIsPassword,
                      suffixPressed: () {
                        SignUpCubit.get(context).changePassword();
                      },
                      validate: (String value) {
                        if (value.isEmpty) {
                          return "field must not be empty";
                        }
                      }),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  defaultTextField(
                      controller: confirmPasswordcontroller,
                      type: TextInputType.visiblePassword,
                      label: " Confirm Password",
                      theme: theme,
                      suffix: SignUpCubit.get(context).confirmSuffix,
                      isPassword: SignUpCubit.get(context).confirmIsPassword,
                      suffixPressed: () {
                        SignUpCubit.get(context).changeConfirm();
                      },
                      context: context,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return "field must not be empty";
                        } else if (value != passwordcontroller.text) {
                          return "passwords do not match";
                        }
                      }),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const DateWidget(),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const PlanningToHire(),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  SignUpButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        SignUpCubit.get(context).signUp(
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            email: emailcontroller.text,
                            password: passwordcontroller.text,
                            dob:
                                "${SignUpCubit.get(context).yearController.text}-${SignUpCubit.get(context).monthController.text}-${SignUpCubit.get(context).dayController.text}",
                            mobileNumber: phoneController.text,
                            role:
                                SignUpCubit.get(context).selectedValue == "yes"
                                    ? "hr"
                                    : "user");
                      }
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.05,
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
        ),
      ),
    );
  }
}
