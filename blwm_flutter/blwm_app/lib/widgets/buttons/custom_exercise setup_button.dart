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
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(4)),
            label: const Text('Start Empty and create your own'),
            backgroundColor: Palette.roseyCheeks,
            icon: const Icon(
              Icons.build,
              size: 24.0,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ExerciseSetup()));
            }));
  }
}
