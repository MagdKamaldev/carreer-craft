import 'package:career_craft/core/colors.dart';
import 'package:career_craft/features/home/presentation/views/widgets/home_search_bar.dart';
import 'package:career_craft/features/jobs/presentaion/views/widgets/job_item.dart';
import 'package:flutter/material.dart';

class JobsView extends StatelessWidget {
  const JobsView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const HomeSearchBar(),
        SizedBox(
          height: size.height * 0.02,
        ),
        Container(
          width: double.infinity,
          height: 0.5,
          color: primary,
        ),
        Column(
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
          ],
        )
      ],
    );
  }
}
