import 'dart:developer';

import 'package:flutter/material.dart';
import '../services/databaseService.dart';
import '../models/exercise_model.dart';
import 'week_exercise.dart';
import '../widgets/buttons/add_new_exercise_button.dart';
import '../widgets/add_form.dart';

class FullListPage extends StatefulWidget {
  // final List<Map<String, Object>> weekData;
  // final int weekDataIndex;
  // final VoidCallback nextDay;
  // final VoidCallback previousDay;

  FullListPage({
    Key? key,
    required this.day,
    // required this.weekData,
    // required this.nextDay,
    // required this.previousDay,
    // required this.weekDataIndex,
  }) : super(key: key);

  String day;

  @override
  State<FullListPage> createState() {
    return FullListPageState();
  }
}

class FullListPageState extends State<FullListPage> {
  ExerciseListing databaseService = ExerciseListing();
  // Color iconColor = Colors.grey.shade200;
  List iconColors = [];

  var isSelected = false;
  List<ExerciseModel> selectedExercises = [];

  @override
  void initState() {
    iconColors.clear();
    super.initState();
  }

  final SaveExercises saveExercises = SaveExercises();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("All exercises from database"),
            centerTitle: true,
            automaticallyImplyLeading: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            )),
        body: SafeArea(
            child: Container(
                child: Column(children: [
          Expanded(
            child: FutureBuilder<List>(
              future: databaseService.getAllExercises(),
              builder: (context, snapshot) {
                // print(snapshot.data);
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ExerciseItem(
                          snapshot.data![index]['id'].toString(),
                          snapshot.data![index]['name'],
                          snapshot.data![index]['desc'],
                          index,
                        );
                      });
                } else if (snapshot.hasError) {
                  return Column(children: [
                    const Text('Failed to load'),
                    const CircularProgressIndicator(),
                    Text(snapshot.error.toString())
                  ]);
                }
                return Center(
                    child: Text(
                  "Loading...",
                  style: TextStyle(color: Colors.black, fontSize: 28),
                ));
              },
            ),
          ),
          FloatingActionButton.extended(
            label: const Text('add new exercise'),
            backgroundColor: Colors.teal.shade200,
            icon: const Icon(
              Icons.build,
              size: 24.0,
            ),
            onPressed: () async {
              final value = await Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddForm()));
              setState(() {});
            },
          ),
          selectedExercises.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      color: Colors.green[700],
                      child: Text(
                        "Save (${selectedExercises.length})",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {
                        print(
                            "Save to current day: ${selectedExercises.length}");
                        print(selectedExercises);
                        saveExercises.saveToDay(selectedExercises, widget.day);

                        Navigator.pop(context);
                      },
                    ),
                  ),
                )
              : Container(),
        ]))));
  }

  Widget ExerciseItem(String id, String name, String desc, int index) {
    iconColors.add(Colors.grey.shade200);

    return Card(
        child: ExpansionTile(
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 30,
        ),
      ),
      subtitle: Text(desc),
      trailing: Icon(
        Icons.check_circle,
        color: iconColors[index],
      ),
      children: const <Widget>[
        ListTile(title: Text('This is item')),
      ],
      onExpansionChanged: (bool expanded) {
        setState(() {
          if (expanded) {
            iconColors[index] = Colors.green;
            selectedExercises.add((ExerciseModel(id, name, desc)));
          } else {
            iconColors[index] = Colors.grey.shade200;
            selectedExercises.removeWhere(
              (element) => element.id == id,
            );
          }
        });
      },
    ));
  }
}
