import 'package:flutter_architecture_bloc/core/data/domain/network/simple_reponse/simple_reponse.dart';

class Screenshot extends BaseObject<Screenshot> {
  final String? aspect;
  final String? imagePath;
  final int? height;
  final int? width;
  final String? countryCode;
  final double? voteAverage;
  final int? voteCount;

  Screenshot({
    this.aspect = '',
    this.imagePath = '',
    this.height = 0,
    this.width = 0,
    this.countryCode = '',
    this.voteAverage = 0.0,
    this.voteCount = 0,
  });

  factory Screenshot.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return Screenshot();
    }

    return Screenshot(
        aspect: json['aspect_ratio'].toString(),
        imagePath: json['file_path'],
        height: json['height'],
        width: json['width'],
        countryCode: json['iso_639_1'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count']);
  }

  @override
  Screenshot fromJson(json) {
    return Screenshot.fromJson(json);
  }
}
