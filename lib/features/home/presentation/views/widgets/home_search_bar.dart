import 'package:career_craft/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: primary.shade200,
        ),
        child: SearchBar(
          elevation: MaterialStateProperty.all<double>(0),
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SvgPicture.asset("assets/images/search.svg"),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(primary.shade100),
          hintText: "Search...",
        ),
      ),
    );
  }
}
