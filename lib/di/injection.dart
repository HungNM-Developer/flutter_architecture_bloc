import 'package:dio/dio.dart';
import 'package:flutter_architecture_bloc/app_router.dart';
import 'package:flutter_architecture_bloc/core/data/repositories/articles/article_repository.dart';
import 'package:flutter_architecture_bloc/core/data/repositories/articles/article_repository_impl.dart';
import 'package:flutter_architecture_bloc/core/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_architecture_bloc/core/data/repositories/authentication/authentication_repository_impl.dart';
import 'package:flutter_architecture_bloc/core/data/repositories/forget_password/forget_password_repository.dart';
import 'package:flutter_architecture_bloc/core/data/repositories/forget_password/forget_password_repository_impl.dart';
import 'package:flutter_architecture_bloc/core/domain/local/secure_storage.dart';
import 'package:flutter_architecture_bloc/core/domain/local/shared_prefs.dart';
import 'package:flutter_architecture_bloc/core/domain/network/service/dio_client.dart';
import 'package:flutter_architecture_bloc/states/cubit/articles/articles_cubit.dart';
import 'package:flutter_architecture_bloc/states/cubit/authentication/authentication_cubit.dart';
import 'package:flutter_architecture_bloc/states/cubit/forget_password/forget_password_cubit.dart';
import 'package:flutter_architecture_bloc/states/cubit/session/session_cubit.dart';
import 'package:flutter_architecture_bloc/states/cubit/splash/splash_cubit.dart';
import 'package:get_it/get_it.dart';

import '../core/helpers/dialog_helper.dart';
import '../core/helpers/event_bus.dart';
import '../states/cubit/tab/tab_cubit.dart';

final GetIt getIt = GetIt.instance;
Future<void> registerDependencies() async {
  // Add inject dependency
  getIt.registerSingletonAsync(() => SharedPrefs().init());
  getIt.registerSingleton<SecureStorage>(SecureStorage());
  getIt.registerSingleton<EventBus>(EventBus());
  getIt.registerSingleton(() => AppRouter());
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>(), getIt<SecureStorage>()));
  getIt.registerLazySingleton<DialogHelper>(() => DialogHelperImpl());
  _registerRepositories();
  _registerBlocs();
}

void _registerRepositories() {
  getIt.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(getIt<DioClient>()),
  );
  getIt.registerLazySingleton<ForgetPasswordRepository>(
    () => ForgetPasswordRepositoryImplement(getIt<DioClient>()),
  );
  getIt.registerLazySingleton<ArticleRepository>(
    () => ArticleRepositoryImpl(getIt<DioClient>()),
  );
}

void _registerBlocs() {
  getIt.registerFactory(() => SplashCubit(getIt<SharedPrefs>()));
  getIt.registerFactory(
      () => AuthenticationCubit(getIt<AuthenticationRepository>()));
  getIt.registerFactory(() => SessionCubit());
  getIt.registerFactory(() => TabCubit());
  getIt.registerFactory(
    () => ForgetPasswordCubit(getIt<ForgetPasswordRepository>()),
  );
  getIt.registerFactory(() => ArticlesCubit());
}
