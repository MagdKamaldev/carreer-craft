import 'package:career_craft/features/jobs/presentaion/manager/jobs_cubit/jobs_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobsDropDown extends StatelessWidget {
  final List<String> dropList;
  final String title;
  final void Function(String) onSelected;
  const JobsDropDown(
      {super.key,
      required this.dropList,
      required this.title,
      required this.onSelected});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme theme = Theme.of(context).textTheme;
    return BlocBuilder<JobsCubit, JobsState>(
      builder: (context, state) {
        return SizedBox(
          width: size.width * 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.titleMedium,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              SizedBox(
                width: double.infinity,
                child: DropdownMenu<String>(
                  initialSelection: dropList.first,
                  onSelected: (String? value) {
                    onSelected(value!);
                  },
                  dropdownMenuEntries:
                      dropList.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(
                      value: value,
                      label: value,
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
