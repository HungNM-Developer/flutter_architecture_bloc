import 'package:bloc/bloc.dart';
import 'package:flutter_architecture_bloc/core/data/repositories/forget_password/forget_password_repository.dart';

import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  late final ForgetPasswordRepository _forgetPasswordRepository;
  ForgetPasswordCubit(this._forgetPasswordRepository)
      : super(ForgetPasswordInitial());

  Future<void> restore({required String email}) async {
    final result = await _forgetPasswordRepository.restore(email: email);
    result.fold(
      success: (_) => emit(ForgetPasswordSuccess()),
      error: (_) => emit(ForgetPasswordError()),
    );
  }
}
