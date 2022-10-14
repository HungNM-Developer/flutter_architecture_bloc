import 'package:flutter_architecture_bloc/core/data/repositories/authentication/authentication_repository.dart';
import '../../domain/network/response/api_response.dart';
import '../../domain/network/service/dio_client.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  // ignore: avoid_unused_constructor_parameters
  const AuthenticationRepositoryImpl(DioClient dioClient);
  @override
  Future<ApiResponse> logIn({
    required String username,
    required String password,
  }) {
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => const ApiResponse(data: ''),
    );
  }
}
