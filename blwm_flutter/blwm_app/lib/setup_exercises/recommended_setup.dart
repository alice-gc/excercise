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

class RecommendedSetupState extends State<RecommendedSetup> {
  final _weekData = const [
    {
      'day': 'Monday',
      'mark': '1/7',
      'number': '1',
    },
    {
      'day': 'Tuesday',
      'mark': '2/7',
      'number': '2',
    },
    {
      'day': 'Wednesday',
      'mark': '3/7',
      'number': '3',
    },
    {
      'day': 'Thursday',
      'mark': '4/7',
      'number': '4',
    },
    {
      'day': 'Friday',
      'mark': '5/7',
      'number': '5',
    },
    {
      'day': 'Saturday',
      'mark': '6/7',
      'number': '6',
    },
    {
      'day': 'Sunday',
      'mark': '7/7',
      'number': '7',
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
        centerTitle: true,
        automaticallyImplyLeading: true,
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
              : const WeekSetupEnd(),
        ]),
      ),
    );
  }
}
