import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_sheet/scenes/sheet/component/timecard.component.dart';
import 'package:time_sheet/scenes/sheet/timesheet.provider.dart';

class TimeSheetScene extends StatefulWidget {
  @override
  _TimeSheetSceneState createState() => _TimeSheetSceneState();
}

class _TimeSheetSceneState extends State<TimeSheetScene> {
  @override
  Widget build(BuildContext context) {
    final timeSheetProvider = Provider.of<TimeSheetProvider>(context);
    final timers = timeSheetProvider.timers;

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => timeSheetProvider.createTimer(),
          backgroundColor: Colors.black,
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text('Time range calculation'),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Flexible(
                child: InkWell(
                  onTap: timeSheetProvider.parseTotal,
                  child: Center(
                    child: Text(
                      timeSheetProvider.totalTime,
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: const Radius.circular(15),
                    topRight: const Radius.circular(15),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    child: ListView.builder(
                      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                        value: timers[index],
                        child: new TimeCard(),
                      ),
                      itemCount: timers.length,
                    ),
                  ),
                ),
              ),
            ]));
  }
}
