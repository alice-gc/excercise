import 'package:flutter/material.dart';

import 'week_exercise.dart';
import 'end.dart';

class ExerciseSetup extends StatefulWidget {
  ExerciseSetup({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ExerciseSetupState();
  }
}

class ExerciseSetupState extends State<ExerciseSetup> {
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

  void _previousDay() {
    setState(() {
      if (_weekData.elementAt(_weekDataIndex - 1) == null) {
        Navigator.pop(context);
      } else {
        _weekDataIndex = _weekDataIndex - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Routine Setup'),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: _weekDataIndex < _weekData.length
          ? WeekExercise(
              nextDay: _nextDay,
              previousDay: _previousDay,
              weekDataIndex: _weekDataIndex,
              weekData: _weekData,
            )
          : const WeekSetupEnd(),
    );
  }
}
