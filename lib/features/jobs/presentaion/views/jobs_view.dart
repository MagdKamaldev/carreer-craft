import 'package:career_craft/features/jobs/presentaion/views/widgets/job_item.dart';
import 'package:flutter/material.dart';

class JobsView extends StatelessWidget {
  const JobsView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.04,
        ),
        const JobItem(),
        SizedBox(
          height: size.height * 0.02,
        ),
        const JobItem(),
        SizedBox(
          height: size.height * 0.02,
        ),
        const JobItem(),
        SizedBox(
          height: size.height * 0.02,
        ),
        const JobItem(),
      ],
    );
  }
}
