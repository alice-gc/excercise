import 'package:flutter/material.dart';

import 'package:blwm_app/setup_exercises/exercise_setup.dart';
import 'package:blwm_app/widgets/color_custom_pallette.dart';
import '../../services/databaseService.dart';

class RecommendedButton extends StatelessWidget {
  RecommendedButton({Key? key}) : super(key: key);

  SaveExercises databaseService = SaveExercises();
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 190,
        width: 290,
        child: FloatingActionButton.extended(
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(4)),
          label: const Text('Recomended Settings'),
          backgroundColor: Palette.freshMint,
          icon: const Icon(
            Icons.add_task,
            size: 24.0,
          ),
          onPressed: () {
            databaseService.init();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ExerciseSetup()));
          },
        ));
  }
}
