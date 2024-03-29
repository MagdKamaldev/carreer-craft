import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/features/jobs/data/models/job_model.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';

class JobDetailsViewBody extends StatelessWidget {
  final JobModel job;
  const JobDetailsViewBody({
    super.key,
    required this.job,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(job.company!.companyName!, style: theme.headlineSmall),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  job.company!.address!,
                  style: theme.titleSmall!.copyWith(color: Colors.grey),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text(
                  job.jobDescription!,
                  style: theme.bodyLarge,
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: secondary,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(job.jobLocation!,
                  style: theme.titleMedium!.copyWith(color: primary[600])),
              SizedBox(
                width: size.width * 0.1,
              ),
              Text(
                job.workingTime!,
                style: theme.titleMedium!.copyWith(color: primary[600]),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: secondary,
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${S.of(context).technicalSkills} :",
                  style: theme.titleMedium,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SizedBox(
                  height: size.height *
                      0.05 *
                      job.technicalSkills!.length.toDouble(),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: size.height * 0.01,
                    ),
                    itemCount: job.technicalSkills!.length,
                    itemBuilder: (context, index) => Text(
                      job.technicalSkills![index],
                      style: theme.titleSmall!.copyWith(color: Colors.grey),
                    ),
                  ),
                ),
                Text(
                  "${S.of(context).softSkills} :",
                  style: theme.titleMedium,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SizedBox(
                  height:
                      size.height * 0.05 * job.softSkills!.length.toDouble(),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: size.height * 0.01,
                    ),
                    itemCount: job.softSkills!.length,
                    itemBuilder: (context, index) => Text(
                      job.softSkills![index],
                      style: theme.titleSmall!.copyWith(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                defaultButton(
                  function: () {},
                  context: context,
                  text: S.of(context).applyNow,
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
