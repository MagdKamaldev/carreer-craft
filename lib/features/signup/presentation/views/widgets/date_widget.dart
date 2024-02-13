import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/features/signup/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme theme = Theme.of(context).textTheme;
    SignUpCubit cubit = SignUpCubit.get(context);
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return SizedBox(
          width: size.width,
          child: Row(
            children: [
              SizedBox(
                width: size.width * 0.17,
                child: defaultTextField(
                    controller: cubit.dayController,
                    type: TextInputType.number,
                    label: "DD",
                    theme: theme,
                    context: context,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return "empty";
                      } else if (value.length < 2) {
                        return "2 digits";
                      } else if (value.length > 2) {
                        return "2 digits";
                      }
                    }),
              ),
              SizedBox(
                width: size.width * 0.025,
              ),
              SizedBox(
                width: size.width * 0.17,
                child: defaultTextField(
                    controller: cubit.monthController,
                    type: TextInputType.number,
                    label: "MM",
                    theme: theme,
                    context: context,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return "empty";
                      } else if (value.length < 2) {
                        return "2 digits";
                      } else if (value.length > 2) {
                        return "2 digits";
                      }
                    }),
              ),
              SizedBox(
                width: size.width * 0.025,
              ),
              SizedBox(
                width: size.width * 0.3,
                child: defaultTextField(
                    controller: cubit.yearController,
                    type: TextInputType.number,
                    label: "YYYY",
                    theme: theme,
                    context: context,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return "empty";
                      } else if (value.length < 4) {
                        return "4 digits";
                      } else if (value.length > 4) {
                        return "4 digits";
                      }
                    }),
              ),
              SizedBox(
                width: size.width * 0.025,
              ),
              ElevatedButton(
                onPressed: () => cubit.selectDate(context),
                child: const Icon(Icons.edit),
              ),
            ],
          ),
        );
      },
    );
  }
}
