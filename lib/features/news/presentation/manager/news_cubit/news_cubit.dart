import 'package:career_craft/features/news/data/models/article/article.dart';
import 'package:career_craft/features/news/data/repositories/news_repository_implementation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
   final NewsRepositoryImplementation newsRepository;
  NewsCubit(this.newsRepository) : super(NewsInitial());
  static NewsCubit get(context) => BlocProvider.of(context);

  Future<void> getNews() async {
    emit(NewsLoading());
    var result = await newsRepository.getNews();
    result.fold((failure) {
      emit(NewsFailure(failure.message));
    }, (news) {
      emit(NewsSuccess(news));
    });
  }

 
}
