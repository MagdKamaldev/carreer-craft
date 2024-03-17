import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/utils/themes.dart';
import 'package:career_craft/features/jobs/data/models/job_model.dart';
import 'package:flutter/material.dart';

class JobItem extends StatelessWidget {
  final JobModel job;
  const JobItem({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.95,
      child: Card(
        elevation: 2,
        color: primary.shade400,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/abc.jpg",
                    width: size.width * 0.1,
                    height: size.height * 0.08,
                  ),
                  SizedBox(
                    width: size.width * 0.04,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job.jobTitle!,
                        style: theme.textTheme.titleLarge,
                      ),
                      Text(
                        job.seniorityLevel ?? job.workingTime ?? "",
                        style: theme.textTheme.titleSmall!.copyWith(
                          color: primary.shade700,
                        ),
                      ),
                      Text(
                        job.workingTime!,
                        style: theme.textTheme.titleSmall!.copyWith(
                          color: primary.shade600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
