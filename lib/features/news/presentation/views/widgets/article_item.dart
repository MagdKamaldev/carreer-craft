import 'package:career_craft/core/colors.dart';
import 'package:career_craft/features/news/data/models/article/article.dart';
import 'package:flutter/material.dart';

class ArticleItem extends StatelessWidget {
  final Article article;
  const ArticleItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.all(size.height * 0.02),
      child: Row(
        children: [
          if (article.urlToImage != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: SizedBox(
                height: size.height * 0.14,
                width: size.width * 0.3,
                child: Image.network(
                  article.urlToImage!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          SizedBox(
            width: size.width * 0.05,
          ),
          Expanded(
            child: SizedBox(
              height: size.height * 0.14,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      article.title!,
                      style: Theme.of(context).textTheme.titleLarge,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    article.publishedAt!,
                    style:
                        textTheme.titleSmall!.copyWith(color: primary.shade500),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
