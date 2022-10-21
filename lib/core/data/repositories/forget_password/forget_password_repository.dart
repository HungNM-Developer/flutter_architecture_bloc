import 'package:flutter_architecture_bloc/core/data/domain/network/simple_reponse/simple_reponse.dart';

abstract class ForgetPasswordRepository {
  Future<SingleResponse> restore({required String email});
}
