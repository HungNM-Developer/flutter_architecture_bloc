import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_bloc/di/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/data/domain/local/secure_storage.dart';
import '../core/data/domain/local/shared_prefs.dart';
import '../core/data/domain/network/service/dio_client.dart';
import '../core/data/repositories/authentication/authentication_repository.dart';
import '../core/data/repositories/authentication/authentication_repository_impl.dart';
import '../core/data/repositories/movies/movies_repository_impl.dart';
import '../core/data/repositories/movies/moview_repository.dart';
import 'cubit/authentication/authentication_cubit.dart';
import 'cubit/genre/genre_cubit.dart';
import 'cubit/movie_detail/movie_detail_cubit.dart';
import 'cubit/movies/movie_cubit.dart';
import 'cubit/person/person_cubit.dart';
import 'cubit/search_movie/search_movie_cubit.dart';
import 'cubit/splash/splash_cubit.dart';
import 'cubit/theme/theme_cubit.dart';

// ignore: must_be_immutable
class BlocWrapper extends StatelessWidget {
  final Widget child;

  const BlocWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<DioClient>(
          create: (context) => DioClient(getIt<Dio>(), getIt<SecureStorage>()),
        ),
        RepositoryProvider<AuthenticationRepository>(
          create: (context) => AuthenticationRepositoryImpl(
            getIt<DioClient>(),
          ),
        ),
        RepositoryProvider<MoviesRepository>(
          create: (context) => MoviesRepositoryImpl(getIt<DioClient>()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SplashCubit>(
            create: (context) => SplashCubit(getIt<SharedPrefs>()),
          ),
          BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit(),
          ),
          BlocProvider<AuthenticationCubit>(
            create: (BuildContext context) =>
                AuthenticationCubit(getIt<AuthenticationRepository>()),
          ),
          BlocProvider<MovieCubit>(
            create: (BuildContext context) => getIt<MovieCubit>(),
          ),
          BlocProvider<PersonCubit>(
            create: (BuildContext context) => getIt<PersonCubit>(),
          ),
          BlocProvider<GenreCubit>(
            create: (BuildContext context) => getIt<GenreCubit>()..fetchGenre(),
          ),
          BlocProvider<MovieDetailCubit>(
            create: (BuildContext context) => getIt<MovieDetailCubit>(),
          ),
          BlocProvider<SearchMovieCubit>(
            create: (BuildContext context) => getIt<SearchMovieCubit>(),
          ),
        ],
        child: FutureBuilder(
          future: getIt.allReady(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return child;
            } else {
              return Container(
                color: Colors.white,
              );
            }
          },
        ),
      ),
    );
  }

  static resetInitState(BuildContext context) {
    ///Xử lý khi login hay logout cần reset lại hết Bloc
    BlocProvider.of<AuthenticationCubit>(context).resetInitState();
  }
}
