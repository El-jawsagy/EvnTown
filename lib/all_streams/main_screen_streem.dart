import 'dart:async';

class MainStream {
  bool isEvent = true;
  bool isTimeLine = false;
  Timer timer;

  final StreamController<bool> _eventStreamController =
      StreamController<bool>.broadcast();

  Stream<bool> get eventStream => _eventStreamController.stream;

  StreamSink<bool> get eventSink => _eventStreamController.sink;

  final StreamController<bool> _timeLineStreamController =
      StreamController<bool>.broadcast();

  Stream<bool> get timeLineStream => _timeLineStreamController.stream;

  StreamSink<bool> get timeLineSink => _timeLineStreamController.sink;

  MainStream() {
    _eventStreamController.add(isEvent);
    _timeLineStreamController.add(isTimeLine);
    _eventStreamController.stream.listen(_makeEventChange);
    _timeLineStreamController.stream.listen(_makeTimeLineChange);
  }

  void _makeEventChange(bool event) {
    isEvent = event;
    eventSink.add(isEvent);
  }

  void _makeTimeLineChange(bool event) {
    isTimeLine = event;
    timeLineSink.add(isEvent);
  }

  void dispose() {
    _eventStreamController.close();
    _timeLineStreamController.close();
  }
//todo: complete the stream
}
