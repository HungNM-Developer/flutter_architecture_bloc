// ignore_for_file: cast_nullable_to_non_nullable

import 'package:flutter/material.dart';
import 'package:flutter_architecture_bloc/core/core.dart';
import 'package:flutter_architecture_bloc/ui/screens/authentication/authentication_screen.dart';
import 'package:flutter_architecture_bloc/ui/screens/movie_home/movie_home_screen.dart';
import 'package:flutter_architecture_bloc/ui/screens/splash/splash_screem.dart';
import 'package:go_router/go_router.dart';

import 'core/data/models/movie.dart';
import 'ui/screens/authentication/confirm_restore_password/confirm_restore_password_screen.dart';
import 'ui/screens/authentication/forget_password/forget_password_screen.dart';
import 'ui/screens/authentication/new_password/new_password_screen.dart';
import 'ui/screens/detail_movie/movie_detail_screen.dart';
import 'ui/screens/onboarding/onboarding_screen.dart';

class AppRouter {
  static GoRouter goRouter = GoRouter(
    initialLocation: RoutePath.splashScreen,
    routes: <GoRoute>[
      GoRoute(
        path: RoutePath.splashScreen,
        name: RouteName.splashScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: RoutePath.onboardingScreen,
        name: RouteName.onboardingScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingScreen();
        },
      ),
      GoRoute(
        path: RoutePath.authenticationScreen,
        name: RouteName.authenticationScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const AuthenticationScreen();
        },
        routes: [
          GoRoute(
              path: RoutePath.forgotPassword,
              name: RouteName.forgotPassword,
              builder: (BuildContext context, GoRouterState state) {
                return const ForgetPasswordScreen();
              },
              routes: [
                GoRoute(
                  path: RoutePath.confirmRestorePassword,
                  name: RouteName.confirmRestorePassword,
                  builder: (BuildContext context, GoRouterState state) {
                    return const ConfirmRestorePasswordScreen();
                  },
                ),
              ]),
          GoRoute(
            path: RoutePath.newPasswordScreen,
            name: RouteName.newPasswordScreen,
            builder: (BuildContext context, GoRouterState state) {
              return const NewPasswordScreen();
            },
          ),
        ],
      ),
      GoRoute(
        path: RoutePath.movieHomeScreen,
        name: RouteName.movieHomeScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const MovieHomeScreen();
        },
        routes: [
          GoRoute(
            path: RoutePath.movieDetailScreen,
            name: RouteName.movieDetailScreen,
            builder: (BuildContext context, GoRouterState state) {
              return MovieDetailScreen(
                movie: state.extra as Movie,
              );
            },
          )
        ],
      ),
    ],
  );
}
