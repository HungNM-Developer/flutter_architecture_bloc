import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/config.dart';
import '../../core/core.dart';

class MaskImage extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? backdropPath;
  final String? title;
  const MaskImage(
      {super.key, this.onPressed, required this.backdropPath, this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(14.r),
            ),
            child: UIUtility.cachedNetworkImage(
              imageUrl: 'https://image.tmdb.org/t/p/original/$backdropPath',
              height: double.infinity / 3,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholderWidget: const SizedBox.shrink(),
              errorWidget: const Image(
                image: AppImages.imgNotFound,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 42.h,
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(14.r),
                ),
                color: Colors.black.withOpacity(0.7),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: RPadding(
              padding: const EdgeInsets.only(
                bottom: 10,
                left: 15,
              ),
              child: Text(
                title ?? '',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                  fontFamily: 'muli',
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
