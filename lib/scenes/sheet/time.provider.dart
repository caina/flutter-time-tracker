import 'package:flutter/foundation.dart';

class TimeProvider with ChangeNotifier {
  String totalTime = "0h";
  Duration start = Duration(milliseconds: 0);
  Duration end = Duration(milliseconds: 0);

  Duration _getDuration(String time) {
    var timeSplit = time.split(":");
    if (timeSplit.length == 0 || time.isEmpty) {
      return Duration(milliseconds: 0);
    }

    return new Duration(
        hours: int.parse(timeSplit[0]),
        minutes: timeSplit.length == 2 ? int.parse(timeSplit[1]) : 0);
  }

  Duration calculateTimeDiff() {
    var start = this.start.inMilliseconds;
    var end = this.end.inMilliseconds;

    return new Duration(milliseconds: end - start);
  }

  void startTimerChanger(String time) {
    start = _getDuration(time);
    updateLabel();
  }

  void endTimerChange(String time) {
    end = _getDuration(time);
    updateLabel();
  }

  void updateLabel() {
    totalTime = asString(calculateTimeDiff());
    notifyListeners();
  }

  static String asString(Duration duration) {
    var diff = duration.toString().split(":");
    return "${diff[0]}:${diff[1]}";
  }
}
