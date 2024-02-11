import 'package:career_craft/core/utils/app_router.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpTab extends StatefulWidget {
  const SignUpTab({super.key});

  @override
  State<SignUpTab> createState() => _SignUpTabState();
}

class _SignUpTabState extends State<SignUpTab> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmPasswordcontroller = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dayController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  List<String> dropList = <String>['User', 'HR'];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1920, 8),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        dayController.text = picked.day.toString();
        monthController.text = picked.month.toString();
        yearController.text = picked.year.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.06,
            ),
            SizedBox(
              width: size.width * 0.9,
              child: Row(
                children: [
                  SizedBox(
                    width: size.width * 0.42,
                    child: defaultTextField(
                        controller: firstNameController,
                        type: TextInputType.name,
                        label: "First Name",
                        theme: theme,
                        context: context,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return "field must not be empty";
                          }
                        }),
                  ),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  SizedBox(
                    width: size.width * 0.42,
                    child: defaultTextField(
                        controller: lastNameController,
                        type: TextInputType.name,
                        label: "Last Name",
                        theme: theme,
                        context: context,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return "field must not be empty";
                          }
                        }),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            defaultTextField(
                controller: emailcontroller,
                type: TextInputType.emailAddress,
                label: "Email",
                theme: theme,
                context: context,
                validate: (String value) {
                  if (value.isEmpty) {
                    return "field must not be empty";
                  }
                }),
            SizedBox(
              height: size.height * 0.02,
            ),
            defaultTextField(
                controller: phoneController,
                type: TextInputType.emailAddress,
                label: "Phone number",
                theme: theme,
                context: context,
                validate: (String value) {
                  if (value.isEmpty) {
                    return "field must not be empty";
                  }
                }),
            SizedBox(
              height: size.height * 0.02,
            ),
            defaultTextField(
                controller: passwordcontroller,
                type: TextInputType.visiblePassword,
                label: "Password",
                theme: theme,
                context: context,
                suffix: Icons.remove_red_eye,
                validate: (String value) {
                  if (value.isEmpty) {
                    return "field must not be empty";
                  }
                }),
            SizedBox(
              height: size.height * 0.02,
            ),
            defaultTextField(
                controller: confirmPasswordcontroller,
                type: TextInputType.visiblePassword,
                label: " Confirm Password",
                theme: theme,
                suffix: Icons.remove_red_eye,
                context: context,
                validate: (String value) {
                  if (value.isEmpty) {
                    return "field must not be empty";
                  }
                }),
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              width: size.width,
              child: Row(
                children: [
                  SizedBox(
                    width: size.width * 0.17,
                    child: defaultTextField(
                        controller: dayController,
                        type: TextInputType.number,
                        label: "DD",
                        theme: theme,
                        context: context,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return "field must not be empty";
                          }
                        }),
                  ),
                  SizedBox(
                    width: size.width * 0.025,
                  ),
                  SizedBox(
                    width: size.width * 0.17,
                    child: defaultTextField(
                        controller: monthController,
                        type: TextInputType.number,
                        label: "MM",
                        theme: theme,
                        context: context,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return "field must not be empty";
                          }
                        }),
                  ),
                  SizedBox(
                    width: size.width * 0.025,
                  ),
                  SizedBox(
                    width: size.width * 0.3,
                    child: defaultTextField(
                        controller: yearController,
                        type: TextInputType.number,
                        label: "YYYY",
                        theme: theme,
                        context: context,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return "field must not be empty";
                          }
                        }),
                  ),
                  SizedBox(
                    width: size.width * 0.025,
                  ),
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: const Icon(Icons.edit),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              children: [
                Text(
                  "Role :",
                  style: theme.headlineSmall,
                ),
                const Spacer(),
                DropdownMenu<String>(
                  initialSelection: dropList.first,
                  onSelected: (String? value) {},
                  dropdownMenuEntries:
                      dropList.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(
                        value: value, label: value);
                  }).toList(),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            defaultButton(
                function: () {
                  GoRouter.of(context).pushReplacement(AppRouter.homeView);
                },
                context: context,
                text: "Sign Up"),
            SizedBox(
              height: size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
