import 'package:flutter/material.dart';
import 'package:flutter_architecture_bloc/core/routes/route_name.dart';
import 'package:flutter_architecture_bloc/states/cubit/splash/splash_cubit.dart';
import 'package:flutter_architecture_bloc/states/cubit/splash/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../config/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      bloc: context.read<SplashCubit>()..checkStatus(),
      listener: (context, currentState) {
        if (currentState is SplashLoggedIn) {
          context.goNamed(RouteName.mainScreen);
        } else if (currentState is SplashNewSession) {
          context.goNamed(RouteName.onboardingScreen);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: SizedBox(
              height: 350.r,
              width: 350.r,
              child: Lottie.asset(
                AppSvgImages.lotieImage,
                width: 340.r,
                height: 340.r,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
