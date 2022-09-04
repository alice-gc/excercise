import 'package:blwm_app/widgets/add_form.dart';
import 'package:flutter/material.dart';
import 'package:blwm_app/setup_exercises/exercise_setup.dart';

class AddNewExerciseButton extends StatelessWidget {
  const AddNewExerciseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: const Text('add new exercise'),
      backgroundColor: Colors.teal.shade200,
      icon: const Icon(
        Icons.build,
        size: 24.0,
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddForm()));
      },
    );
  }
}
