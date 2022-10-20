import 'package:flutter_architecture_bloc/core/data/domain/network/simple_reponse/simple_reponse.dart';

import 'screen_shot.dart';

class MovieImage extends BaseObject<MovieImage> {
  final List<Screenshot> backdrops;
  final List<Screenshot> posters;

  MovieImage({
    this.backdrops = const [],
    this.posters = const [],
  });

  factory MovieImage.fromJson(Map<String, dynamic>? result) {
    if (result == null) {
      return MovieImage();
    }

    return MovieImage(
      backdrops: (result['backdrops'] as List)
          .map((b) => Screenshot.fromJson(b))
          .toList(),
      posters: (result['posters'] as List)
          .map((b) => Screenshot.fromJson(b))
          .toList(),
    );
  }

  @override
  MovieImage fromJson(json) {
    return MovieImage.fromJson(json);
  }
}
