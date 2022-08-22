import 'dart:developer';

import 'package:flutter/material.dart';
import '../services/databaseService.dart';
import 'exercise_model.dart';

// import 'package:blwm_app/widgets/nav_drawer.dart';

class FullListPage extends StatefulWidget {
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
                print(snapshot.data);
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ExerciseItem(
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
                return const CircularProgressIndicator();
              },
            ),
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
                      },
                    ),
                  ),
                )
              : Container(),
        ]))));
  }

  Widget ExerciseItem(String name, String desc, int index) {
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
            selectedExercises.add((ExerciseModel(index, name, desc)));
          } else {
            iconColors[index] = Colors.grey.shade200;
            selectedExercises.removeWhere(
              (element) => element.id == index,
            );
          }
        });
      },
    ));
  }
}
