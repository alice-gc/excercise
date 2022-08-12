import 'package:flutter/material.dart';

import 'week_exercise.dart';
import 'end.dart';

class RecommendedSetup extends StatefulWidget {
  const RecommendedSetup({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RecommendedSetupState();
  }
}

//make a request
class RecommendedSetupState extends State<RecommendedSetup> {
  final _weekData = const [
    {
      'day': 'Monday',
      'mark': '1/7',
      'text': ['1'],
    },
    {
      'day': 'Tuesday',
      'mark': '2/7',
      'text': ['2'],
    },
    {
      'day': 'Wednesday',
      'mark': '3/7',
      'text': ['3'],
    },
    {
      'day': 'Thursday',
      'mark': '4/7',
      'text': ['4'],
    },
    {
      'day': 'Friday',
      'mark': '5/7',
      'text': ['5'],
    },
    {
      'day': 'Saturday',
      'mark': '6/7',
      'text': ['6'],
    },
    {
      'day': 'Sunday',
      'mark': '7/7',
      'text': ['7'],
    },
  ];

  var _weekDataIndex = 0;

  void _nextDay() {
    setState(() {
      _weekDataIndex = _weekDataIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommended Setup'),
      ),
      body: Center(
        child: Column(children: [
          const Text('Recomended exercise setup',
              style: TextStyle(color: Colors.black, fontSize: 22)),
          _weekDataIndex < _weekData.length
              ? WeekExercise(
                  nextDay: _nextDay,
                  weekDataIndex: _weekDataIndex,
                  weekData: _weekData,
                )
              : WeekSetupEnd(),
        ]),
      ),
    );
  }
}
