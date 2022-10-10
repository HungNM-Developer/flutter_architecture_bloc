import 'package:bloc/bloc.dart';
import 'package:flutter_architecture_bloc/core/helpers/event_bus.dart';
import 'package:flutter_architecture_bloc/di/injection.dart';

import '../../../core/events/session_expired_event.dart';
import 'session_state.dart';

class SessionCubit extends Cubit<SessionState> {
  final _eventBus = getIt<EventBus>();
  SessionCubit() : super(SessionInitial()) {
    _eventBus.on<SessionExpiredEvent>().listen((_) {
      emit(SessionExpired());
    });
  }
}
