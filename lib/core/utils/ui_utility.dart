import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_bloc/config/config.dart';
import 'package:flutter_architecture_bloc/ui/widgets/app_circular_progress_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIUtility {
  static Widget cachedNetworkImage({
    required String imageUrl,
    double? width,
    double? height,
    BoxFit? fit,
    ImageWidgetBuilder? imageBuilder,
    Widget? errorWidget,
  }) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: imageBuilder,
      width: width,
      height: height,
      fit: fit,
      memCacheHeight: height?.toInt(),
      memCacheWidth: width?.toInt(),
      errorWidget: (_, __, ___) =>
          errorWidget ??
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: const DecorationImage(
                image: AppImages.charmander,
                fit: BoxFit.fill,
              ),
            ),
          ),
      placeholder: (_, __) => const Center(
        child: AppCircularProgressIndicator(),
      ),
    );
  }
}
