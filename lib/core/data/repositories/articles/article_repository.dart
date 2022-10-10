import 'package:flutter_architecture_bloc/core/data/models/articles/article_model.dart';
import 'package:flutter_architecture_bloc/core/domain/network/response/api_response.dart';

abstract class ArticleRepository {
  Future<ApiResponse<List<ArticleModel>?>> getTopHeadlineArticles();
  Future<ApiResponse<List<ArticleModel>>> getHeadlineBusinessArticles();
  Future<ApiResponse<List<ArticleModel>>> getArticleCategory(String category);
  Future<ApiResponse<ArticleModel>> searchArticles(String query,
      {int page = 1});
  Future<ApiResponse<String>> saveBookmarkArticle(ArticleModel article);
  Future<ApiResponse<String>> removeBookmarkArticle(ArticleModel article);
  Future<bool> isAddedToBookmarkArticle(String url);
  Future<ApiResponse<List<ArticleModel>>> getBookmarkArticles();
}
