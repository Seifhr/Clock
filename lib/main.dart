import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Clock(),
    ));
  }
}

class Clock extends StatefulWidget {
  Clock({Key key}) : super(key: key);
  @override
  _Clock createState() => _Clock();
}

class _Clock extends State<Clock> {
  double minutesAngle=0;
  double secondsAngle=0;
  double hoursAngle=0;
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      final now= DateTime.now();
      setState(() {
        secondsAngle= (pi/30)*now.second;
        minutesAngle= (pi/30)* now.minute;
        hoursAngle=(pi/6 *now.hour)+(pi/45 *minutesAngle);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Stack(
            children: <Widget>[
              Image.asset('images/Clock.png'),
              //seconds
              Transform.rotate(
                child: Container(
                  child: Container(
                    height: 140,
                    width: 2,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  alignment: Alignment(0,-0.35),
                ),
                angle: secondsAngle,
              ),
              //Minutes
              Transform.rotate(
                child: Container(
                  child: Container(
                    height: 95,
                    width: 5,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  alignment: Alignment(0,-0.35),
                ),
                angle: minutesAngle,
              ),
              //Hours
              Transform.rotate(
                child: Container(
                  child: Container(
                    height: 70,
                    width: 7,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  alignment: Alignment(0,-0.25),
                ),
                angle: hoursAngle,
              ),
            ],
          ),
        width: 370,
        height: 370,
        ),
      color: Colors.black,
      alignment: Alignment.center,
      );
  }
}