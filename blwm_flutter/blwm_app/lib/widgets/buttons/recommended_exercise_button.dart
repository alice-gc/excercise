import 'package:flutter/material.dart';
import 'package:blwm_app/setup_exercises/recommended_setup.dart';

class RecommendedButton extends StatelessWidget {
  const RecommendedButton({Key? key}) : super(key: key);

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
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const RecommendedSetup()));
      },
    );
  }
}
