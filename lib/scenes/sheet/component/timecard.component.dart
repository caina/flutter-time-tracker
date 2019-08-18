import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:time_sheet/scenes/sheet/time.provider.dart';

class TimeCard extends StatefulWidget {
  @override
  _TimeCardState createState() => _TimeCardState();
}

class _TimeCardState extends State<TimeCard> {
  final _startController = TextEditingController();
  final _endController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _startController.addListener(() {
      var text = _startController.text;
      if (text.length > 2 && !text.contains(":")) {
        _startController.text = text.substring(0, 2) + ":" + text.substring(2);
      }
    });
    _endController.addListener(() {
      var text = _endController.text;
      if (text.length > 2 && !text.contains(":")) {
        _endController.text = text.substring(0, 2) + ":" + text.substring(2);
      }
    });

    return Card(
        elevation: 1,
        child: Container(
          padding: const EdgeInsets.all(5),
          width: double.infinity,
          child: Consumer<TimeProvider>(builder: (ctx, time, child) {
            return Column(children: <Widget>[
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 80,
                      height: 58,
                      margin: const EdgeInsets.only(right: 15),
                      decoration: const BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      child: Center(
                          child: Text(
                        time.totalTime,
                        style: Theme.of(context).textTheme.caption,
                      )),
                    ),
                    Flexible(
                        child: TextField(
                      decoration: const InputDecoration(labelText: "Start"),
                      keyboardType: TextInputType.number,
                      controller: _startController,
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(5),
                      ],
                      onChanged: (val) {
                        time.startTimerChanger(val);
                      },
                    )),
                    Flexible(
                        child: TextField(
                      decoration: const InputDecoration(labelText: "End"),
                      keyboardType: TextInputType.number,
                      controller: _endController,
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(5),
                      ],
                      onChanged: (val) {
                        time.endTimerChange(val);
                      },
                    )),
                  ])
            ]);
          }),
        ));
  }
}
