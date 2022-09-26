import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:blwm_app/widgets/color_custom_pallette.dart';
import '../services/databaseService.dart';

class TodayWidget extends StatefulWidget {
  @override
  State<TodayWidget> createState() {
    return TodayWidgetState();
  }
}

class TodayWidgetState extends State<TodayWidget> {
  ExerciseListingByDay databaseService = ExerciseListingByDay();

  late Future<List<dynamic>> dataFuture;
  DateTime date = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        FutureBuilder<List<dynamic>>(
          future: databaseService
              .getByDayExercises(DateFormat('EEEE').format(date)),
          builder: (context, snapshot) {
            print('Today day');
            print(DateFormat('EEEE').format(date));

            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return SizedBox(
                  height: 500,
                  width: 375,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.beach_access,
                          size: 64.0,
                          color: Palette.wollySocks,
                        ),
                        SizedBox(height: 25),
                        Text('Resting day',
                            style: TextStyle(
                                color: Palette.wollySocks, fontSize: 22)),
                      ]),
                );
              }
              return SizedBox(
                  height: 500,
                  width: 375,
                  child: SingleChildScrollView(
                      child: ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, i) {
                      return Container(
                        child: Card(
                            elevation: 8.0,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 6.0),
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              //leading: Icon(Icons.account_circle),
                              title: Text(
                                snapshot.data![i]['name'],
                                style: const TextStyle(fontSize: 16),
                              ),
                            )),
                      );
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
      ],
    ));
  }
}
