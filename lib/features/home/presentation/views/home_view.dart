import 'package:career_craft/core/colors.dart';
import 'package:career_craft/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:career_craft/features/home/presentation/views/widgets/home_bottom_nav.dart';
import 'package:career_craft/features/home/presentation/views/widgets/home_search_bar.dart';
import 'package:career_craft/features/jobs/presentaion/views/jobs_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: homeAppBar(size),
      body: Column(
        children: [
          const HomeSearchBar(),
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            width: double.infinity,
            height: 0.5,
            color: primary,
          ),
          const JobsView(),
        ],
      ),
      bottomNavigationBar: homeBottomNav(),
    );
  }
}
