import 'dart:async';

import '../../domain/network/response/api_response.dart';

abstract class AuthenticationRepository {
  Future<ApiResponse> logIn({
    required String username,
    required String password,
  });
}
