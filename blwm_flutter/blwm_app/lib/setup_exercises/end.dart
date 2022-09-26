import 'package:flutter/material.dart';
import '../../main.dart';

class WeekSetupEnd extends StatelessWidget {
  const WeekSetupEnd({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('All done!'),
      // content: const Text('AlertDialog description'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Great!'),
        ),
      ],
    );
  }
}
