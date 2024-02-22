import 'package:career_craft/core/colors.dart';
import 'package:career_craft/features/news/data/models/article/article.dart';
import 'package:career_craft/features/news/presentation/views/widgets/article_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ArticleBuilder extends StatelessWidget {
  final List<Article> articles;
  const ArticleBuilder({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        myDivider(),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => ArticleItem(
              article: articles[index],
            ),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: articles.length,
          ),
        ),
        myDivider()
      ],
    );
  }

  Widget myDivider() => Container(
        width: double.infinity,
        height: 1.0,
        color: secondary,
      );
}
