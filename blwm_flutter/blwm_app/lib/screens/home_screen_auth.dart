import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:blwm_app/services/databaseService.dart';
import 'package:blwm_app/widgets/color_custom_pallette.dart';

import 'package:blwm_app/widgets/buttons/recommended_exercise_button.dart';
import 'package:blwm_app/widgets/buttons/custom_exercise%20setup_button.dart';
import 'package:blwm_app/widgets/today.dart';

class AuthHomeScreen extends StatefulWidget {
  @override
  _AuthHomeScreenState createState() => _AuthHomeScreenState();
}

class _AuthHomeScreenState extends State<AuthHomeScreen> {
  ExerciseListing databaseService = ExerciseListing();

  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
        future: databaseService.checkForExercises(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.length == 0) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RecommendedButton(),
                    const SizedBox(height: 50),
                    const CustomButton(),
                  ]);
            } else {
              return Column(children: [
                const SizedBox(
                  height: 20.0,
                ),
                const Text('Welcome Again!',
                    style: TextStyle(color: Palette.evergreen, fontSize: 22)),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 500,
                  width: 350,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(20.0),
                      primary: Colors.white,
                      // backgroundColor: Colors.teal,
                      side: const BorderSide(
                          color: Palette.roseyCheeks, width: 5),
                    ),
                    child: Column(
                      children: [
                        const Text('Todays Excercises',
                            style: TextStyle(
                              color: Palette.roseyCheeks,
                            )),
                        TodayWidget(),
                      ],
                    ),
                    onPressed: () async {},
                  ),
                ),
              ]);
            }
          } else {
            return const Center(child: const CircularProgressIndicator());
          }
        });
  }
}
