import 'package:career_craft/features/signup/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanningToHire extends StatelessWidget {
  const PlanningToHire({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    SignUpCubit cubit = SignUpCubit.get(context);
    List<String> dropList = <String>[
      S.of(context).yes,
      S.of(context).no,
      S.of(context).maybe
    ];
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return Row(
          children: [
            Text(
              S.of(context).hirePlan,
              style: theme.titleSmall,
            ),
            const Spacer(),
            DropdownMenu<String>(
              initialSelection: dropList.first,
              onSelected: (String? value) {
                cubit.changeSelectedValue(value!);
              },
              dropdownMenuEntries:
                  dropList.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(
                  value: value,
                  label: value,
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
