import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/utils/themes.dart';
import 'package:career_craft/features/companies/data/models/company_model/company_model.dart';
import 'package:flutter/material.dart';

class CompanyItem extends StatelessWidget {
  final CompanyModel company;
  const CompanyItem({super.key, required this.company});

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
                    width: size.width * 0.1,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        company.companyName!,
                        style: theme.textTheme.titleLarge,
                      ),
                      Text(
                        (company.address != null &&
                                company.address!.length > 20)
                            ? "${company.address!.substring(0, 20)}.."
                            : company.address!,
                        style: theme.textTheme.bodyLarge!
                            .copyWith(color: primary[700]),
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
