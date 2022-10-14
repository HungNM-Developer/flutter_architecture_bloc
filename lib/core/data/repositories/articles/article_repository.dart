import 'package:flutter_architecture_bloc/core/data/models/articles/article_model.dart';

import '../../domain/network/simple_reponse/simple_reponse.dart';

abstract class ArticleRepository {
  Future<SingleResponse?> getTopHeadlineArticles();
  Future<List<ArticleModel>> getHeadlineBusinessArticles();
  Future<List<ArticleModel>> getArticleCategory(String category);
  Future<ArticleModel> searchArticles(String query, {int page = 1});
  Future<String> saveBookmarkArticle(ArticleModel article);
  Future<String> removeBookmarkArticle(ArticleModel article);
  Future<bool> isAddedToBookmarkArticle(String url);
  Future<List<ArticleModel>> getBookmarkArticles();
}
