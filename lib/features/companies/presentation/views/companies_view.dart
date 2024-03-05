import 'package:career_craft/features/companies/presentation/views/widgets/company_item.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';

class CompaniesView extends StatelessWidget {
  const CompaniesView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).companies,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            const CompanyItem(),
            SizedBox(height: size.height,),
          ],
        ),
      ),
    );
  }
}
