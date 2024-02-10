import 'package:career_craft/colors.dart';
import 'package:career_craft/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:career_craft/features/home/presentation/views/widgets/home_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: homeAppBar(size),
      body: Padding(
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
      ),
      bottomNavigationBar: homeBottomNav(),
    );
  }
}
