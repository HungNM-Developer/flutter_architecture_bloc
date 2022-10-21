import 'dart:async';

import 'package:flutter_architecture_bloc/core/data/domain/network/simple_reponse/simple_reponse.dart';

abstract class AuthenticationRepository {
  Future<SingleResponse> logIn({
    required String username,
    required String password,
  });
}
