import 'package:flutter/material.dart';
import 'package:blwm_app/setup_exercises/exercise_setup.dart';
import '../../services/databaseService.dart';

class RecommendedButton extends StatelessWidget {
  RecommendedButton({Key? key}) : super(key: key);

  SaveExercises databaseService = SaveExercises();
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: const Text('Recomended Settings'),
      backgroundColor: Colors.teal.shade200,
      icon: const Icon(
        Icons.build,
        size: 24.0,
      ),
      onPressed: () {
        databaseService.init();

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ExerciseSetup()));
      },
    );
  }
}
