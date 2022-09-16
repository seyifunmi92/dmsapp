import 'dart:async';
import 'package:dms/blocs/counter.dart';

class CounterBloc {
  int _currentIndex = 0;

  final _counterControllerState = StreamController<int>();
  StreamSink<int> get _count => _counterControllerState.sink;
  Stream<int> get counter => _counterControllerState.stream;

  final _counterControllerEvent = StreamController<CounterEvent>();
  Sink<CounterEvent> get counterEventSink => _counterControllerEvent.sink;

  void _eventMap(CounterEvent _event) {
    if (_event is IncreaseCount) {
      _currentIndex++;
    } else {
      _currentIndex--;
    }
    _count.add(_currentIndex);
  }

  CounterBloc() {
    _counterControllerEvent.stream.listen(_eventMap);
  }

  void dispose() {
    _counterControllerState.close();
    _counterControllerEvent.close();
  }
}

class CounterBlock {
  int mycurrentIndex = 0;

  final _counterControllerState = StreamController<int>();
  StreamSink<int> get _count => _counterControllerState.sink;
  Stream<int> get counter => _counterControllerState.stream;

  final _counterControllerEvent = StreamController<CounterEvent>();
  Sink<CounterEvent> get counterEventSink => _counterControllerEvent.sink;

  CounterBlock() {
    _counterControllerEvent.stream.listen(_eventMap);
  }

  void _eventMap(CounterEvent _event) {
    if (_event is IncreaseCount) {
      mycurrentIndex++;
    } else {
      mycurrentIndex--;
    }
    _count.add(mycurrentIndex);
  }

  void dispose() {
    _counterControllerState.close();
    _counterControllerEvent.close();
  }
}
