import 'package:bloc/bloc.dart';
import 'package:flutter_architecture_bloc/core/data/models/articles/article_model.dart';
import 'package:flutter_architecture_bloc/core/data/repositories/articles/article_repository.dart';
import 'package:flutter_architecture_bloc/di/injection.dart';

part 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  final _articleRepository = getIt<ArticleRepository>();

  ArticlesCubit() : super(ArticlesInitial());
}
