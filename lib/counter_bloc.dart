import 'dart:async';

import 'package:flutter_app/counter_event.dart';

class CounterBloc {
  int _counter = 0;

  final _counterStreamController = StreamController<int>();
  final _counterEventController = StreamController<CounterEvent>();

  CounterBloc() {
    _counterEventController.stream.listen(mapEventToState);
  }

  StreamSink<int> get _sinkCounter => _counterStreamController.sink;
  Stream<int> get counter => _counterStreamController.stream;

  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  void mapEventToState(CounterEvent event) {
    if (event is IncrementEvent) {
      _counter++;
    }

    _sinkCounter.add(_counter);
  }

  void dispose() {
    _counterStreamController.close();
    _counterStreamController.close();
  }
}
