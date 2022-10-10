import 'dart:async';

import 'package:flutter_architecture_bloc/core/data/models/user/user.dart';
import 'package:flutter_architecture_bloc/core/domain/network/response/api_response.dart';

abstract class AuthenticationRepository {
  Future<ApiResponse<User>> logIn({
    required String username,
    required String password,
  });
}
