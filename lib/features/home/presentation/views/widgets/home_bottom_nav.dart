import 'package:career_craft/core/colors.dart';
import 'package:career_craft/core/utils/themes.dart';
import 'package:career_craft/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:career_craft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

Widget homeBottomNav(context) => BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return BottomNavigationBar(
          selectedLabelStyle: theme.textTheme.titleSmall,
          selectedItemColor: primary,
          currentIndex: HomeCubit.get(context).screensIndex,
          onTap: (value) {
            HomeCubit.get(context).changeScreen(value);
          },
          items: [
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset("assets/images/Briefcase.svg"),
                ),
                label: S.of(context).jobs),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset("assets/images/company.svg"),
                ),
                label: S.of(context).companies),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset("assets/images/news.svg"),
                ),
                label: S.of(context).news),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset("assets/images/User.svg"),
                ),
                label: S.of(context).profile),
          ],
        );
      },
    );
