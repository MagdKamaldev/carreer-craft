import 'package:career_craft/core/colors.dart';
import 'package:flutter/material.dart';

Widget resetCodeContainer(Size size, BuildContext context,TextEditingController controller) => Container(
      height: size.height * 0.06,
      width: size.width * 0.12,
      decoration: BoxDecoration(
        border: Border.all(color: primary, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      
      child: TextFormField(
        controller: controller,
        onSaved: (pin2) {},
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
        style: Theme.of(context).textTheme.bodyLarge,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        autofocus: true,
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: "",
        ),
      ),
    );
