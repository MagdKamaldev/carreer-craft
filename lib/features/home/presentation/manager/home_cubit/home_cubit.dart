import 'package:bloc/bloc.dart';
import 'package:career_craft/features/companies/presentation/views/companies_view.dart';
import 'package:career_craft/features/jobs/presentaion/views/jobs_view.dart';
import 'package:career_craft/features/news/presentation/views/news_view.dart';
import 'package:career_craft/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  int screensIndex = 0;
  List<Widget> screens = [
    const JobsView(),
    const CompaniesView(),
    const NewsView(),
    const ProfileView(),
  ];
  changeScreen(int index) {
    screensIndex = index;
    emit(HomeChangeScreen());
  }
}
