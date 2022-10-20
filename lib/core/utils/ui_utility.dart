import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_bloc/ui/widgets/app_circular_progress_indicator.dart';

class UIUtility {
  static Widget cachedNetworkImage({
    required String imageUrl,
    double? width,
    double? height,
    double? radius,
    BoxFit? fit,
    BoxShape? shape,
    ImageWidgetBuilder? imageBuilder,
    Widget? errorWidget,
    Widget? placeholderWidget,
  }) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: imageBuilder,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      errorWidget: (_, __, ___) =>
          errorWidget ??
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              shape: shape ?? BoxShape.rectangle,
              borderRadius: BorderRadius.all(
                Radius.circular(radius ?? 0),
              ),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/img_not_found.jpg'),
              ),
            ),
          ),
      placeholder: (_, __) =>
          placeholderWidget ??
          SizedBox(
            width: width,
            height: height,
            child: const Center(
              child: AppCircularProgressIndicator(),
            ),
          ),
    );
  }
}
