import 'package:career_craft/core/errors/failures.dart';
import 'package:career_craft/core/utils/locale.dart';
import 'package:career_craft/core/utils/news_api_service.dart';
import 'package:career_craft/features/news/data/models/article/article.dart';
import 'package:career_craft/features/news/data/repositories/news_repository.dart';
import 'package:dartz/dartz.dart';

class NewsRepositoryImplementation implements NewsRepository {
  final NewsApiServices newsApiServices;

  NewsRepositoryImplementation({
    required this.newsApiServices,
  });

  @override
  Future<Either<Failure, List<Article>>> getNews() async {
    try {
      final response = await newsApiServices.getData(query: {
        "country": "us",
        "category": "business",
        "Accept-Language": deviceLocale.languageCode,
        "apiKey": "d965aeb7b50b4b58877e29092d6c4165",
      });
      return Right((response.data["articles"] as List)
          .map((e) => Article.fromJson(e))
          .toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
