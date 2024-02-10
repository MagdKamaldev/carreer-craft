import 'package:career_craft/core/utils/app_router.dart';
import 'package:career_craft/features/forgotPassword/presentation/views/widgets/reset_code_container.dart';
import 'package:flutter/material.dart';
import 'package:career_craft/colors.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:go_router/go_router.dart';

class ResetCodeViewBody extends StatelessWidget {
  const ResetCodeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
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
              style: theme.bodyMedium!.copyWith(color: primary.shade500),
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
                  resetCodeContainer(size, context),
                  resetCodeContainer(size, context),
                  resetCodeContainer(size, context),
                  resetCodeContainer(size, context),
                  resetCodeContainer(size, context),
                  resetCodeContainer(size, context),
                ],
              ),
            ),
            SizedBox(
              height: size.height * .15,
            ),
            defaultButton(
                function: () {
                  GoRouter.of(context).push(AppRouter.resetPasswordView);
                },
                context: context,
                text: "Confirm Code")
          ],
        ),
      ),
    );
  }
}
