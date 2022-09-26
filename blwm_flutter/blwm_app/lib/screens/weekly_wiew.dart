import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:grouped_list/grouped_list.dart';

import 'package:blwm_app/widgets/color_custom_pallette.dart';
import '../services/databaseService.dart';

class WeeklyView extends StatefulWidget {
  @override
  State<WeeklyView> createState() {
    return WeeklyViewState();
  }
}

class WeeklyViewState extends State<WeeklyView> {
  ExerciseListing databaseService = ExerciseListing();
// getAllExercises
  late Future<List<dynamic>> dataFuture;
  DateTime date = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weekly routine'),
          centerTitle: true,
          automaticallyImplyLeading: true,
        ),
        body: FutureBuilder<List<dynamic>>(
          future: databaseService.getAllForUser(),
          builder: (context, snapshot) {
            print('Today day');
            print(DateFormat('EEEE').format(date));

            if (snapshot.hasData) {
              log("DATA " + snapshot.data.toString());
              if (snapshot.data!.isEmpty) {
                return SizedBox(
                  height: 500,
                  width: 375,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.sports_gymnastics,
                          size: 64.0,
                          color: Palette.wollySocks,
                        ),
                        SizedBox(height: 25),
                        Text('Please add exercises first',
                            style: TextStyle(
                                color: Palette.wollySocks, fontSize: 22)),
                      ]),
                );
              }

              return GroupedListView<dynamic, String>(
                elements: snapshot.data!,
                groupBy: (element) => element['no'].toString(),
                groupComparator: (value1, value2) => value2.compareTo(value1),
                itemComparator: (item1, item2) =>
                    item1['day'].compareTo(item2['day']),
                order: GroupedListOrder.DESC,
                groupHeaderBuilder: (element) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    element['day'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Palette.evergreen),
                  ),
                ),
                itemBuilder: (c, element) {
                  return Card(
                    elevation: 8.0,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 6.0),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      //leading: Icon(Icons.account_circle),
                      title: Text(
                        element['exercise']['name'].toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                      subtitle: Text(
                        element['exercise']['desc'].toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
              );
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
        ));
  }
}
