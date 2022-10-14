import '../../domain/network/service/dio_client.dart';
import '../../domain/network/simple_reponse/simple_reponse.dart';
import '../../models/articles/article_model.dart';
import 'article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final DioClient dioClient;
  const ArticleRepositoryImpl(this.dioClient);

  @override
  Future<List<ArticleModel>> getArticleCategory(String category) {
    throw UnimplementedError();
  }

  @override
  Future<List<ArticleModel>> getBookmarkArticles() {
    throw UnimplementedError();
  }

  @override
  Future<List<ArticleModel>> getHeadlineBusinessArticles() {
    throw UnimplementedError();
  }

  //------------------------MAKE TEST----------------------
  @override
  Future<SingleResponse?> getTopHeadlineArticles() async {
    final response = await dioClient.get(
      'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=5112ca0d3fee4f6cb6d50b6e35c6927e',
      object: ArticleModel(),
    );
    return response;
  }

  //------------------------MAKE TEST----------------------

  @override
  Future<bool> isAddedToBookmarkArticle(String url) {
    throw UnimplementedError();
  }

  @override
  Future<String> removeBookmarkArticle(ArticleModel article) {
    throw UnimplementedError();
  }

  @override
  Future<String> saveBookmarkArticle(ArticleModel article) {
    throw UnimplementedError();
  }

  @override
  Future<ArticleModel> searchArticles(String query, {int page = 1}) {
    throw UnimplementedError();
  }
}
