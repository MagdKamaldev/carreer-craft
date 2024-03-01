import 'package:career_craft/core/errors/failures.dart';
import 'package:career_craft/features/news/data/models/article/article.dart';
import 'package:dartz/dartz.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<Article>>> getNews();
}
