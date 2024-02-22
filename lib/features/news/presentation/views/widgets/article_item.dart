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
      padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
      child: Column(
        children: [
          Text(
            article.source!.name != null ? article.source!.name! : "V2 News",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(
            height: size.height * 0.007,
          ),
          myDivider(),
          SizedBox(
            height: size.height * 0.007,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.height * 0.01),
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
                    height: article.urlToImage != null
                        ? size.height * 0.14
                        : size.height * 0.11,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            article.title!,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: primary.shade700,
                                ),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          "${article.publishedAt!.substring(0, 10)} (${article.publishedAt!.substring(11, 16)})",
                          style: textTheme.titleSmall!
                              .copyWith(color: primary.shade500),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget myDivider() => Container(
        width: double.infinity,
        height: 1,
        color: secondary,
      );
}
