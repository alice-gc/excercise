import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:blwm_app/widgets/color_custom_pallette.dart';
import '../services/databaseService.dart';

class TodaysView extends StatefulWidget {
  @override
  State<TodaysView> createState() {
    return TodaysViewState();
  }
}

class TodaysViewState extends State<TodaysView> {
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
    return Scaffold(
        appBar: AppBar(
          title: Text('Today: ' + DateFormat('EEEE').format(date)),
          centerTitle: true,
          automaticallyImplyLeading: true,
        ),
        body: SafeArea(
            child: Column(
          children: [
            FutureBuilder<List<dynamic>>(
              future: databaseService.getByDayExercises("Monday"),
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
                            child: Row(
                              children: [
                                Container(
                                    width: 140,
                                    child: Text(
                                      snapshot.data![i]['name'],
                                      style: const TextStyle(fontSize: 30.0),
                                    )),
                                SizedBox(width: 50),
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
          ],
        )));
  }
}
