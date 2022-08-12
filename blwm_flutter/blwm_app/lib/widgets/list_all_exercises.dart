import 'dart:developer';

import 'package:flutter/material.dart';
import '../services/databaseService.dart';
import 'package:blwm_app/widgets/nav_drawer.dart';

class FullList extends StatelessWidget {
  const FullList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const FullListPage(title: 'Show All'),
    );
  }
}

class FullListPage extends StatefulWidget {
  const FullListPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FullListPage> createState() => _FullListPageState();
}

class _FullListPageState extends State<FullListPage> {
  ExerciseListing databaseService = ExerciseListing();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: NavDrawer(),
        body: Container(
          child: FutureBuilder<List>(
            future: databaseService.getAllExercises(),
            builder: (context, snapshot) {
              print(snapshot.data);
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, i) {
                    return Card(
                      child: ListTile(
                        title: Text(
                          snapshot.data![i]['name'],
                          style: const TextStyle(fontSize: 30.0),
                        ),
                        subtitle: Text(
                          snapshot.data![i]['desc'],
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
        ));
  }
}
