import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:blwm_app/services/databaseService.dart';
import 'package:blwm_app/widgets/buttons/recommended_exercise_button.dart';
import 'package:blwm_app/widgets/buttons/custom_exercise%20setup_button.dart';

class AuthHomeScreen extends StatefulWidget {
  @override
  _AuthHomeScreenState createState() => _AuthHomeScreenState();
}

class _AuthHomeScreenState extends State<AuthHomeScreen> {
  ExerciseListing databaseService = ExerciseListing();

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
                    SizedBox(height: 50),
                    CustomButton(),

                    // SizedBox(
                    //   height: 100,
                    //   width: 100,
                    //   child: FloatingActionButton(
                    //     child: Icon(Icons.add), //child widget inside this button
                    //     onPressed: () {
                    //       print("Button is pressed.");
                    //       //task to execute when this button is pressed
                    //     },
                    //   ),
                    // ),
                  ]);
            } else {
              return const Text('Welcome Again!',
                  style: TextStyle(color: Colors.black, fontSize: 22));
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
