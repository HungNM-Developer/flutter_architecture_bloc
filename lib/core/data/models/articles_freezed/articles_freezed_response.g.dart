// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles_freezed_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ArticlesFreezedResponse _$$_ArticlesFreezedResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ArticlesFreezedResponse(
      totalResults: json['totalResults'] as int?,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => Articles.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ArticlesFreezedResponseToJson(
        _$_ArticlesFreezedResponse instance) =>
    <String, dynamic>{
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };
