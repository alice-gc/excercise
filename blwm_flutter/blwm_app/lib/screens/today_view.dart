import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:blwm_app/widgets/color_custom_pallette.dart';
import 'package:blwm_app/widgets/today.dart';

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
        body: TodayWidget());
  }
}
