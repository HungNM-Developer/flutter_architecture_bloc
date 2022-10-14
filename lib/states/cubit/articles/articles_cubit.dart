import 'package:bloc/bloc.dart';
import 'package:flutter_architecture_bloc/core/data/models/articles/article_model.dart';
import 'package:flutter_architecture_bloc/core/data/repositories/articles/article_repository.dart';
import 'package:flutter_architecture_bloc/di/injection.dart';

part 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  final _articleRepository = getIt<ArticleRepository>();

  ArticlesCubit() : super(ArticlesInitial());
  final List<ArticleModel> _lstArticles = [];

  Future<void> getHeadLineArticles() async {
    final result = await _articleRepository.getTopHeadlineArticles();
    if (result?.status == 'ok') {
      result?.data?.forEach((element) {
        _lstArticles.add(element);
      });
      emit(ArticlesLoadSuccess(articles: _lstArticles));
    } else {
      emit(ArticlesLoadFailed(message: ''));
    }
  }
}
