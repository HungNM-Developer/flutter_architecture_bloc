// ignore_for_file: cast_nullable_to_non_nullable

import 'package:flutter/material.dart';
import 'package:flutter_architecture_bloc/core/core.dart';
import 'package:flutter_architecture_bloc/ui/screens/authentication/authentication_screen.dart';
import 'package:flutter_architecture_bloc/ui/screens/splash/splash_screem.dart';
import 'package:go_router/go_router.dart';

import 'ui/screens/authentication/confirm_restore_password/confirm_restore_password_screen.dart';
import 'ui/screens/authentication/forget_password/forget_password_screen.dart';
import 'ui/screens/authentication/new_password/new_password_screen.dart';
import 'ui/screens/main/articles/article_detail_screen.dart';
import 'ui/screens/main/articles/articles_screen.dart';
import 'ui/screens/main/bookmark/bookmark_screen.dart';
import 'ui/screens/main/main_screen.dart';
import 'ui/screens/main/search/search_screen.dart';

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
        path: RoutePath.authenticationScreen,
        name: RouteName.authenticationScreen,
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return AuthenticationScreen();
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
        path: RoutePath.mainScreen,
        name: RouteName.mainScreen,
        builder: (BuildContext context, GoRouterState state) {
          // ignore: prefer_const_constructors
          return MainScreen();
        },
        routes: [
          GoRoute(
            path: RoutePath.searchScreen,
            name: RouteName.searchScreen,
            builder: (BuildContext context, GoRouterState state) {
              return const SearchScreen();
            },
          ),
          GoRoute(
              path: RoutePath.homeScreen,
              name: RouteName.homeScreen,
              builder: (BuildContext context, GoRouterState state) {
                return const ArticlesScreen();
              },
              routes: [
                GoRoute(
                  path: RoutePath.detailArticleScreen,
                  name: RouteName.detailArticleScreen,
                  builder: (BuildContext context, GoRouterState state) {
                    return const ArticleDetailScreen();
                  },
                ),
              ]),
          GoRoute(
            path: RoutePath.bookmarkScreen,
            name: RouteName.bookmarkScreen,
            builder: (BuildContext context, GoRouterState state) {
              return const BookmarkScreen();
            },
          ),
        ],
      ),
    ],
  );
}
