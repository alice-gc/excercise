import 'dart:developer';

import 'package:blwm_app/setup_exercises/list_all_exercises.dart';
import 'package:flutter/material.dart';

import 'Day.dart';
import 'next_save.dart';
import '../services/databaseService.dart';

class WeekExercise extends StatefulWidget {
  final List<Map<String, Object>> weekData;
  final int weekDataIndex;
  final VoidCallback nextDay;
  final VoidCallback previousDay;

  WeekExercise({
    required this.weekData,
    required this.nextDay,
    required this.previousDay,
    required this.weekDataIndex,
  });

  @override
  State<WeekExercise> createState() {
    return WeekExerciseState();
  }
}

class WeekExerciseState extends State<WeekExercise> {
  ExerciseListingByDay databaseService = ExerciseListingByDay();
  late Future<List<dynamic>> dataFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    dataFuture = databaseService.getByDayExercises(
        widget.weekData[widget.weekDataIndex]['day'] as String);
  }

  BackNextButton refreshAndGoForward() {
    dataFuture = databaseService.getByDayExercises(
        widget.weekData[widget.weekDataIndex]['day'] as String);
    return BackNextButton(selectHandler: widget.nextDay, title: "Next");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Day(
          widget.weekData[widget.weekDataIndex]['day'] as String,
        ),
        Day(
          widget.weekData[widget.weekDataIndex]['mark'] as String,
        ),
        FutureBuilder<List<dynamic>>(
          future: databaseService.getByDayExercises(
              widget.weekData[widget.weekDataIndex]['day'] as String),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.length == 0) {
                return Column(children: [
                  const Text('Empty/free day'),
                ]);
              }
              return SizedBox(
                  height: 450,
                  width: 375,
                  child: SingleChildScrollView(
                      child: ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, i) {
                      return Container(
                          child: Card(
                        child: Row(
                          children: [
                            Container(
                                width: 140,
                                child: Text(
                                  snapshot.data![i]['name'],
                                  style: const TextStyle(fontSize: 30.0),
                                )),
                            SizedBox(width: 50),
                            Container(
                              width: 170,
                              child: IconButton(
                                  onPressed: () => {
                                        log("Card selected = " + i.toString()),
                                        // Grab index

                                        // Delete from database using databaseService type of function
                                        databaseService.deleteByDayExercises(
                                          snapshot.data![i]['id'],
                                        ),

                                        // This will refresh the state and fingers crossed it will update  the list view
                                        setState(() {
                                          dataFuture =
                                              databaseService.getByDayExercises(
                                                  widget.weekData[
                                                          widget.weekDataIndex]
                                                      ['day'] as String);
                                        }),
                                      },
                                  icon: Icon(Icons.delete)),
                            ),
                          ],
                        ),
                      ));
                    },
                  )));
            } else if (snapshot.hasError) {
              log("Loading error " + snapshot.error.toString());
              return Column(children: [
                const Text('Failed to load'),
                const CircularProgressIndicator(),
                Text(snapshot.error.toString())
              ]);
            }
            return const CircularProgressIndicator();
          },
        ),
        FloatingActionButton.extended(
          label: const Text('Add Excercise'),
          backgroundColor: Color.fromARGB(76, 207, 206, 206),
          icon: const Icon(
            Icons.add,
            size: 60,
          ),
          onPressed: () async {
            final value = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FullListPage(
                          day: widget.weekData[widget.weekDataIndex]['day']
                              as String,
                        )));
            setState(() {});
          },
        ),
        SizedBox(height: 10),
        Center(
          child: Row(
            children: [
              const SizedBox(width: 40),
              BackNextButton(selectHandler: widget.previousDay, title: "Back"),
              const SizedBox(width: 10),
              BackNextButton(selectHandler: widget.nextDay, title: "Next"),

              // NextSave(nextDay, 'Next')
            ],
          ),
        )
      ],
    ));
  }
}
