import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/utils/components.dart';
import 'package:career_craft/features/companies/presentation/views/add_company_view.dart';
import 'package:career_craft/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:career_craft/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:career_craft/features/home/presentation/views/widgets/home_bottom_nav.dart';
import 'package:career_craft/features/home/presentation/views/widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          drawer: const AppDrawer(),
          appBar: homeAppBar(size, context, scaffoldKey),
          body: HomeCubit.get(context)
              .screens[HomeCubit.get(context).screensIndex],
          bottomNavigationBar: homeBottomNav(context),
          floatingActionButton: (HomeCubit.get(context).screensIndex == 1)
              ? FloatingActionButton(
                  onPressed: () {
                    navigateTo(context, const AddCompanyView());
                  },
                  backgroundColor: primary[500],
                  child: Icon(
                    Icons.add,
                    color: primary[100],
                  ),
                )
              : null,
        );
      },
    );
  }
}
