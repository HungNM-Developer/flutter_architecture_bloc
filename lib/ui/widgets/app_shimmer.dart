import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxShape? shape;
  final double? radius;
  const AppShimmer({
    Key? key,
    this.width,
    this.height,
    this.shape,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black38,
      highlightColor: Colors.white,
      child: SizedBox(
        height: height ?? 16.h,
        width: width ?? double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: shape ?? BoxShape.rectangle,
            borderRadius: BorderRadius.circular(radius ?? 14.r),
            color: Colors.black38,
          ),
        ),
      ),
    );
  }
}
