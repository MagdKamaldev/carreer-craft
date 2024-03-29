import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/errors/error_snackbar.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/core/utils/service_locator.dart';
import 'package:career_craft/features/forgotPassword/data/repositories/forgot_password_repository_implementation.dart';
import 'package:career_craft/features/forgotPassword/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:career_craft/features/forgotPassword/presentation/views/reset_code_view.dart';
import 'package:career_craft/features/forgotPassword/presentation/views/widgets/forgot_password_button.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextTheme theme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) =>
          ForgotPasswordCubit(getIt<ForgotPasswordRepositoryImplementation>()),
      child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if (state is SendCodeSuccessState) {
            navigateTo(context, const ResetCodeView());
            showErrorSnackbar(
                context: context,
                icon: "assets/images/true.svg",
                title: S.of(context).checkMail,
                body: state.message);
          } else if (state is SendCodeFailureState) {
            showErrorSnackbar(
                context: context, title: "Error", body: state.message);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * .08,
                    ),
                    Text(
                      S.of(context).forgotPasswordText,
                      style: theme.titleLarge,
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Text(
                      S.of(context).forgotPasswordText2,
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
                          return null;
                        }),
                    SizedBox(
                      height: size.height * .08,
                    ),
                    Text(
                      S.of(context).weWillSend,
                      style:
                          theme.bodyMedium!.copyWith(color: primary.shade500),
                    ),
                    SizedBox(
                      height: size.height * .15,
                    ),
                    ForgotPasswordButton(onPressed: () {
                      if (formKey.currentState!.validate()) {
                        ForgotPasswordCubit.get(context)
                            .sendCode(emailController.text);
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
