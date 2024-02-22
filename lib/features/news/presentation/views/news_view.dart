import 'package:career_craft/core/errors/error_snackbar.dart';
import 'package:career_craft/core/utils/service_locator.dart';
import 'package:career_craft/features/news/data/repositories/news_repository_implementation.dart';
import 'package:career_craft/features/news/presentation/manager/news_cubit/news_cubit.dart';
import 'package:career_craft/features/news/presentation/views/widgets/article_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(getIt<NewsRepositoryImplementation>())..getNews(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {
          if (state is NewsFailure) {
            showErrorSnackbar(
                context: context, title: "Loading error", body: state.message);
          }
        },
        builder: (context, state) {
          if (state is NewsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NewsSuccess) {
            return ArticleBuilder(articles: state.articles);
          } else {
            return SvgPicture.asset("assets/images/warning.svg");
          }
        },
      ),
    );
  }
}
