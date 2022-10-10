part of 'articles_cubit.dart';

abstract class ArticlesState {}

class ArticlesInitial extends ArticlesState {}

class ArticlesLoading extends ArticlesState {}

class ArticlesLoadSuccess extends ArticlesState {
  List<ArticleModel> articles;

  ArticlesLoadSuccess({this.articles = const []});
}

class ArticlesLoadFailed extends ArticlesState {
  String message;

  ArticlesLoadFailed({this.message = ''});
}
