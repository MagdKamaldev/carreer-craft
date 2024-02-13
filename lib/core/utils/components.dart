import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/utils/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

PreferredSizeWidget defaultAppBar(
  BuildContext context,
) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    toolbarHeight: MediaQuery.of(context).size.height * 0.16,
    centerTitle: true,
    title: Column(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.09,
            width: MediaQuery.of(context).size.width * 0.2,
            child: SvgPicture.asset(AppAssets.logo)),
        Text(
          'Career Craft',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    ),
  );
}

Widget defaultButton({
  double height = 49,
  double width = double.infinity,
  bool isUpperCase = false,
  double radius = 100.0,
  required VoidCallback function,
  required BuildContext context,
  required String text,
  Color? color,
  Color? textColor,
}) =>
    Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color ?? primary,
        ),
        child: MaterialButton(
          onPressed: function,
          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: textColor ?? primary.shade200, fontSize: 16),
          ),
        ));

Widget defaultTextField({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  IconData? suffix,
  bool isPassword = false,
  bool isClickable = true,
  required TextTheme theme,
  required BuildContext context,
  required Function validate,
  void Function(String?)? onSubmit,
  void Function()? suffixPressed,
}) =>
    Container(
      decoration: BoxDecoration(
        color: primary.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: primary.shade600),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: TextFormField(
          controller: controller,
          keyboardType: type,
          obscureText: isPassword,
          enabled: isClickable,
          onFieldSubmitted: onSubmit,
          validator: (value) {
            return validate(value);
          },
          style: theme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
          cursorColor: primary.shade600,

          //disable the line below text
          decoration: InputDecoration(
            hintText: label,
            hintStyle: theme.bodyMedium!.copyWith(color: primary.shade600),
            border: InputBorder.none,
            suffixIcon: suffix != null
                ? IconButton(
                    onPressed: suffixPressed,
                    icon: Icon(
                      suffix,
                      color: primary.shade600,
                    ),
                  )
                : null,
          ),
        ),
      ),
    );


void navigateTo(context, widget) => Navigator.push(
    context,
    CupertinoPageRoute(
      builder: (context) => widget,
    ));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
        context, CupertinoPageRoute(builder: (context) => widget), (route) {
      return false;
    });
