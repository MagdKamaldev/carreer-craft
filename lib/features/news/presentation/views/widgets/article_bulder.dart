import 'package:career_craft/features/news/data/models/article/article.dart';
import 'package:career_craft/features/news/presentation/views/widgets/article_builder.dart';
import 'package:flutter/material.dart';

class ArticleBuilder extends StatelessWidget {
  final List<Article> articles;
  const ArticleBuilder({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => ArticleItem(
        article:  articles[index],
      ),
      separatorBuilder: (context, index) => myDivider(),
      itemCount: 10,
    );
  }

  Widget myDivider() => Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 20.0,
        ),
        child: Container(
          width: double.infinity,
          height: 1.0,
          color: Colors.grey[300],
        ),
      );
}
