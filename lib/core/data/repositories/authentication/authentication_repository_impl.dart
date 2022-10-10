import 'package:flutter_architecture_bloc/core/data/models/user/user.dart';
import 'package:flutter_architecture_bloc/core/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_architecture_bloc/core/domain/network/response/api_response.dart';
import 'package:flutter_architecture_bloc/core/domain/network/service/dio_client.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  // ignore: avoid_unused_constructor_parameters
  const AuthenticationRepositoryImpl(DioClient dioClient);
  @override
  Future<ApiResponse<User>> logIn({
    required String username,
    required String password,
  }) {
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => const ApiResponse<User>(data: User()),
    );
  }
}
