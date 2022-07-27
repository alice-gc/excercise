import 'package:blwm_app/screens/recommended_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';

class RecommendedButton extends StatelessWidget {
  const RecommendedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: Text('Start Empty and create your own'), // <-- Text
      backgroundColor: Colors.red.shade200,
      icon: Icon(
        // <-- Icon
        Icons.build,
        size: 24.0,
      ),
      onPressed: () {
        Navigator.push(context,
          MaterialPageRoute(
          builder: (context) =>  RecommendedSetup()));
      },
    );
  }
}
