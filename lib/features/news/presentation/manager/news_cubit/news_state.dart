part of 'news_cubit.dart';

sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsSuccess extends NewsState {
  final List<Article> articles;
  NewsSuccess(this.articles);
}

final class NewsFailure extends NewsState {
  final String message;
  NewsFailure(this.message);
}
