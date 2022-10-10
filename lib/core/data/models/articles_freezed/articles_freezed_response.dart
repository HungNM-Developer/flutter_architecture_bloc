import 'package:flutter_architecture_bloc/core/data/models/articles_freezed/articles.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'articles_freezed_response.freezed.dart';
part 'articles_freezed_response.g.dart';

@freezed
class ArticlesFreezedResponse with _$ArticlesFreezedResponse {
  const factory ArticlesFreezedResponse({
    int? totalResults,
    List<Articles>? articles,
  }) = _ArticlesFreezedResponse;

  factory ArticlesFreezedResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticlesFreezedResponseFromJson(json);
}
