import 'package:flutter_architecture_bloc/core/data/repositories/authentication/authentication_repository.dart';
import '../../domain/network/service/dio_client.dart';
import '../../domain/network/simple_reponse/simple_reponse.dart';
import '../../models/user/user.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  // ignore: avoid_unused_constructor_parameters
  const AuthenticationRepositoryImpl(DioClient dioClient);
  @override
  Future<SingleResponse<User>> logIn({
    required String username,
    required String password,
  }) {
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => SingleResponse<User>(data: const User()),
    );
  }
}
