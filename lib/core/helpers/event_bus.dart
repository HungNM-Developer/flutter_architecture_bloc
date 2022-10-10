import 'dart:async';

class EventBus {
  final StreamController<Object> _streamController;

  StreamController<Object> get streamController => _streamController;

  EventBus() : _streamController = StreamController.broadcast();

  Stream<T> on<T>() {
    if (T == dynamic) {
      return streamController.stream as Stream<T>;
    } else {
      return streamController.stream.where((event) => event is T).cast<T>();
    }
  }

  void fire(Object event) {
    streamController.add(event);
  }

  void dispose() {
    _streamController.close();
  }
}
