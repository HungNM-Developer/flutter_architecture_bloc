import 'package:freezed_annotation/freezed_annotation.dart';

part 'articles.freezed.dart';
part 'articles.g.dart';

@freezed
class Articles with _$Articles {
  const factory Articles({
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    DateTime? publishedAt,
    String? content,
  }) = _Articles;

  factory Articles.fromJson(Map<String, dynamic> json) =>
      _$ArticlesFromJson(json);
}
