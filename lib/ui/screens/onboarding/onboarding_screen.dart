import 'package:flutter/material.dart';
import 'package:flutter_architecture_bloc/config/config.dart';
import 'package:flutter_architecture_bloc/core/core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/button_gradient.dart';
import '../../widgets/custom_outline.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDarkBlue,
      extendBody: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          70.verticalSpace,
          CustomOutline(
            strokeWidth: 4,
            radius: 200.r,
            padding: const EdgeInsets.all(4),
            width: 330.r,
            height: 330.r,
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.kPinkColor,
                  AppColors.kPinkColor.withOpacity(0),
                  AppColors.kGreenColor.withOpacity(0.1),
                  AppColors.kGreenColor
                ],
                stops: const [
                  0.2,
                  0.4,
                  0.6,
                  1
                ]),
            child: Lottie.asset(
              AppSvgImages.lotieImage,
              width: 350.h,
              height: 350.h,
              fit: BoxFit.fill,
            ),
          ),
          60.verticalSpace,
          Text(
            'Watch movies in\nVirtual Reality',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.kWhiteColor.withOpacity(0.85),
              fontSize: 34.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          35.verticalSpace,
          Text(
            'Download and watch offline\nwherever you are',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.kWhiteColor.withOpacity(0.75),
              fontSize: 16.sp,
            ),
          ),
          30.verticalSpace,
          ButtonGradient(
            onTap: () {
              context.goNamed(RouteName.authenticationScreen);
            },
            title: 'Sign In',
            height: 38.h,
            width: 160.w,
            type: ButtonType.primary,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) {
                return Container(
                  height: 7.h,
                  width: 7.h,
                  margin: REdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == 0
                        ? AppColors.kGreenColor
                        : AppColors.kWhiteColor.withOpacity(0.2),
                  ),
                );
              },
            ),
          ),
          30.verticalSpace
        ],
      ),
    );
  }
}
