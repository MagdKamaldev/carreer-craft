import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/errors/error_snackbar.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/features/companies/presentation/manager/companies_cubit/companies_cubit.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCompanyButton extends StatelessWidget {
  final void Function() onPressed;
  const AddCompanyButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<CompaniesCubit, CompaniesState>(
      listener: (context, state) {
        if (state is CreateCompanyLoaded) {
          Navigator.pop(context);
          showErrorSnackbar(
              context: context,
              title: "success",
              body: "your Company has been Deleted successfully !",
              icon: "assets/images/true.svg");
        } else if (state is CreateCompanyError) {
          showErrorSnackbar(
              context: context, title: "Delete Error", body: state.message);
        }
      },
      builder: (context, state) {
        if (state is CreateCompanyLoading) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: secondary,
            ),
          );
        } else {
          return defaultButton(
            function: onPressed,
            context: context,
            text: S.of(context).addCompany,
            height: size.height * 0.06,
          );
        }
      },
    );
  }
}
