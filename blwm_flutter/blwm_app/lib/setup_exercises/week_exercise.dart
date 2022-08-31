import 'dart:developer';

import 'package:blwm_app/widgets/list_all_exercises.dart';
import 'package:flutter/material.dart';

import 'Day.dart';
import 'next_save.dart';
import '../services/databaseService.dart';

class WeekExercise extends StatelessWidget {
  final List<Map<String, Object>> weekData;

  final int weekDataIndex;
  final VoidCallback nextDay;

  WeekExercise({
    required this.weekData,
    required this.nextDay,
    required this.weekDataIndex,
  });

  ExerciseListingByDay databaseService = ExerciseListingByDay();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Column(children: <Widget>[
      // Day(
      //   weekData[weekDataIndex]['day'] as String,
      // ),

      // Day(
      //   weekData[weekDataIndex]['mark'] as String,
      // ),

      FutureBuilder<List<dynamic>>(
        future: databaseService
            .getByDayExercises(weekData[weekDataIndex]['day'] as String),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data?.length,
              itemBuilder: (context, i) {
                return Card(
                  child: ListTile(
                    tileColor: Colors.white60,
                    title: Text(
                      snapshot.data![i]['day'],
                      style: const TextStyle(fontSize: 30.0),
                    ),
                    subtitle: Text(
                      snapshot.data![i]['day'],
                      style: const TextStyle(fontSize: 20.0),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Column(children: [
              const Text('Failed to load'),
              const CircularProgressIndicator(),
              Text(snapshot.error.toString())
            ]);
          }
          return const CircularProgressIndicator();
        },
      ),

      // FloatingActionButton.extended(
      //   label: const Text('Add Excercise'),
      //   backgroundColor: Color.fromARGB(76, 207, 206, 206),
      //   icon: const Icon(
      //     Icons.add,
      //     size: 60,
      //   ),
      //   onPressed: () {
      //     Navigator.push(context,
      //         MaterialPageRoute(builder: (context) => FullListPage()));
      //   },
      // ),

      // NextSave(nextDay, 'Next')
    ])))));
  }
}
