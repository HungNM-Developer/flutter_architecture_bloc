import 'package:bloc/bloc.dart';
import 'package:flutter_architecture_bloc/core/data/repositories/authentication/authentication_repository.dart';

import 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  late final AuthenticationRepository _authenticationRepository;
  AuthenticationCubit(AuthenticationRepository authenticationRepository)
      : super(AuthenticationInitial()) {
    _authenticationRepository = authenticationRepository;
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    final result = await _authenticationRepository.logIn(
      username: username,
      password: password,
    );
    result.fold(
      success: (_) => emit(AuthenticationSuccess()),
      error: (_) => emit(AuthenticationFailure()),
    );
  }

  Future<void> resetInitState() async {
    emit(AuthenticationInitial());
  }
}
