import 'package:flutter/foundation.dart';
import 'package:time_sheet/scenes/sheet/time.provider.dart';


class TimeSheetProvider with ChangeNotifier {
  String totalTime = "Tap for total";
  final List<TimeProvider> _timers = [new TimeProvider(), new TimeProvider()];

  List<TimeProvider> get timers => [..._timers];

  void createTimer() {
    this._timers.add(new TimeProvider());
    notifyListeners();
  }

  void parseTotal() {
    var total = this._timers.fold(0,
        (prev, current) => prev + current.calculateTimeDiff().inMilliseconds);

    totalTime = TimeProvider.asString(Duration(milliseconds: total));
    notifyListeners();
  }
}
