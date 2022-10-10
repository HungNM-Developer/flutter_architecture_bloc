import 'package:flutter_architecture_bloc/core/data/models/articles/article_model.dart';

class ArticleResponse {
  final int totalResults;
  final List<ArticleModel> articles;

  ArticleResponse({required this.totalResults, required this.articles});

  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      ArticleResponse(
        totalResults: json['totalResults'],
        articles: List<ArticleModel>.from(
          (json["articles"] as List).map((x) => ArticleModel.fromJson(x)).where(
                (article) =>
                    article.urlToImage != null && article.publishedAt != null,
              ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "totalResults": totalResults,
        "articles": List<dynamic>.from(
          articles.map(
            (x) => x.toJson(),
          ),
        ),
      };
}
