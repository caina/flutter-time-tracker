import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_sheet/scenes/sheet/timesheet.provider.dart';
import 'package:time_sheet/scenes/sheet/timesheet.scene.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: TimeSheetProvider())
      ],
      child: MaterialApp(
        title: 'Time-sheet',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          accentColor: Colors.pinkAccent,
          fontFamily: 'Lato',
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(),
                caption: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.white,
                ),
                display1: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 60,
                ),
              ),
        ),
        home: TimeSheetScene(),
        routes: {

        },
      ),
    );
  }
}
