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

  List<ExerciseListing> selected = [];

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
                    itemBuilder: (context, i) {
                      return ExerciseItem(
                          snapshot.data![i]['name'], snapshot.data![i]['desc']);
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
          )
        ]))));
  }

  Widget ExerciseItem(String name, String desc) {
    // bool isSelected, int index) {
    return Card(
      child: ListTile(
        title: Text(
          name,
          style: const TextStyle(fontSize: 30.0),
        ),
        subtitle: Text(
          desc,
          style: const TextStyle(fontSize: 20.0),
        ),
        onTap: () => print("click"),
      ),
    );
  }
}
