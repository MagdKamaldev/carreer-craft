import 'package:career_craft/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:career_craft/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:career_craft/features/home/presentation/views/widgets/home_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: homeAppBar(size),
          body: HomeCubit.get(context)
              .screens[HomeCubit.get(context).screensIndex],
          bottomNavigationBar: homeBottomNav(context),
        );
      },
    );
  }
}
