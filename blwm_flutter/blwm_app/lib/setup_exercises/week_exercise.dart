import 'package:blwm_app/widgets/example_select.dart';
import 'package:blwm_app/widgets/list_all_exercises.dart';
import 'package:flutter/material.dart';

import 'Day.dart';
import 'next_save.dart';
// import '../widgets/example.dart';

class WeekExercise extends StatelessWidget {
  final List<Map<String, Object>> weekData;

  final int weekDataIndex;
  final VoidCallback nextDay;

  WeekExercise({
    required this.weekData,
    required this.nextDay,
    required this.weekDataIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Day(
          weekData[weekDataIndex]['day'] as String,
        ),
        Day(
          weekData[weekDataIndex]['mark'] as String,
        ),
        FloatingActionButton.extended(
          label: const Text('Add Excercise'),
          backgroundColor: Color.fromARGB(76, 207, 206, 206),
          icon: const Icon(
            Icons.add,
            size: 60,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FullListPage()));
          },
        ),
        FloatingActionButton.extended(
          label: const Text('example'),
          backgroundColor: Color.fromARGB(76, 207, 206, 206),
          icon: const Icon(
            Icons.add,
            size: 60,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Example()));
          },
        ),
        const SizedBox(height: 300),
        NextSave(nextDay, 'Next')
      ],
    );
  }
}