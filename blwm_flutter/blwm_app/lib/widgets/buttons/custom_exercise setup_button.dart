import 'package:flutter/material.dart';

import 'package:blwm_app/setup_exercises/exercise_setup.dart';
import 'package:blwm_app/widgets/color_custom_pallette.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 190,
        width: 290,
        child: FloatingActionButton.extended(
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: BorderSide(color: Colors.white)),
            label: Column(children: const [
              Icon(Icons.build, size: 24.0, color: Palette.evergreen),
              SizedBox(height: 15),
              Text('Start Empty and create your own',
                  style: TextStyle(color: Palette.evergreen, fontSize: 14)),
            ]),
            backgroundColor: Palette.roseyCheeks,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ExerciseSetup()));
            }));
  }
}
