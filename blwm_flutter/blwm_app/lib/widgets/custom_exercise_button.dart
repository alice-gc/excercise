import 'package:blwm_app/screens/recommended_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: const Text('Start Empty and create your own'), 
      icon: const Icon(
        // <-- Icon
        Icons.build,
        size: 24.0,
      ),
      onPressed: () {
        
        Navigator.push(context,
          MaterialPageRoute(
          builder: (context) =>  const RecommendedSetup()));
      
      }
    );
  }
}
