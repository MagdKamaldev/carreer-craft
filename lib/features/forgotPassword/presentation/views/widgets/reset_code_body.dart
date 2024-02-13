import 'package:career_craft/core/errors/error_snackbar.dart';
import 'package:career_craft/core/utils/app_router.dart';
import 'package:career_craft/core/utils/service_locator.dart';
import 'package:career_craft/features/forgotPassword/data/repositories/forgot_password_repository_implementation.dart';
import 'package:career_craft/features/forgotPassword/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:career_craft/features/forgotPassword/presentation/views/widgets/reset_code_button.dart';
import 'package:career_craft/features/forgotPassword/presentation/views/widgets/reset_code_container.dart';
import 'package:flutter/material.dart';
import 'package:career_craft/core/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ResetCodeViewBody extends StatelessWidget {
  const ResetCodeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme theme = Theme.of(context).textTheme;
    TextEditingController controller1 = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    TextEditingController controller3 = TextEditingController();
    TextEditingController controller4 = TextEditingController();
    TextEditingController controller5 = TextEditingController();
    TextEditingController controller6 = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(
        getIt<ForgotPasswordRepositoryImplementation>(),
      ),
      child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if (state is VerifyCodeSuccessState) {
            GoRouter.of(context).push(AppRouter.resetPasswordView);
          } else if (state is VerifyCodeFailureState) {
            showErrorSnackbar(
                context: context,
                title: "Validation Error",
                body: state.message);
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
                      "Reset Code",
                      style: theme.titleLarge,
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Text(
                      "Please enter the code sent to your Email!",
                      style:
                          theme.bodyMedium!.copyWith(color: primary.shade500),
                    ),
                    SizedBox(
                      height: size.height * .08,
                    ),
                    SizedBox(
                      width: size.width * 0.9,
                      height: size.height * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          resetCodeContainer(size, context, controller1),
                          resetCodeContainer(size, context, controller2),
                          resetCodeContainer(size, context, controller3),
                          resetCodeContainer(size, context, controller4),
                          resetCodeContainer(size, context, controller5),
                          resetCodeContainer(size, context, controller6),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * .15,
                    ),
                    ResetCodeButton(onPressed: () {
                      if (formKey.currentState!.validate()) {
                        ForgotPasswordCubit.get(context).verifyCode(
                            controller1.text +
                                controller2.text +
                                controller3.text +
                                controller4.text +
                                controller5.text +
                                controller6.text);
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
