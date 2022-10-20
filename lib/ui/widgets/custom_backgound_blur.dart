import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/config.dart';

class CustomBackgroundBlur extends StatelessWidget {
  const CustomBackgroundBlur({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -100.h,
          left: -100.w,
          child: Container(
            height: 200.h,
            width: 200.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.kGreenColor.withOpacity(0.5),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 200.w,
                sigmaY: 200.h,
              ),
              child: Container(
                height: 200.h,
                width: 200.w,
                color: Colors.transparent,
              ),
            ),
          ),
        ),
        Positioned(
          top: 350.h,
          right: -88.w,
          child: Container(
            height: 166.h,
            width: 166.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.kPinkColor.withOpacity(0.5),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 200.w,
                sigmaY: 200.h,
              ),
              child: Container(
                height: 166.h,
                width: 166.w,
                color: Colors.transparent,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -100.h,
          left: -100.w,
          child: Container(
            height: 200.h,
            width: 200.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.kCyanColor.withOpacity(0.5),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 200.w,
                sigmaY: 200.h,
              ),
              child: Container(
                height: 200.h,
                width: 200.w,
                color: Colors.transparent,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
