import 'package:blwm_app/screens/posts_screen.dart';
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
      label: Text('Recomended Settings'), // <-- Text
      backgroundColor: Colors.teal.shade200,
      icon: Icon(
        // <-- Icon
        Icons.build,
        size: 24.0,
      ),
      onPressed: () {},
    );
  }
}
