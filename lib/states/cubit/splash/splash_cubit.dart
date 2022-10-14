import 'package:bloc/bloc.dart';

import '../../../core/data/domain/local/shared_prefs.dart';
import '../../../core/data/domain/local/shared_prefs_keys.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  late final SharedPrefs _sharedPrefs;
  SplashCubit(SharedPrefs sharedPrefs) : super(SplashInitial()) {
    _sharedPrefs = sharedPrefs;
  }

  Future<void> checkStatus() async {
    return Future.delayed(const Duration(seconds: 2), () {
      final accessToken = _sharedPrefs.getData<String>(
        SharedPrefsKeys.accessToken,
      );
      if (accessToken?.isNotEmpty ?? false) {
        emit(SplashLoggedIn());
      } else {
        emit(SplashNewSession());
      }
    });
  }
}
