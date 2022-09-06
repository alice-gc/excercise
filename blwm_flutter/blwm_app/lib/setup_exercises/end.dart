import 'package:flutter/material.dart';
import '../../main.dart';

class WeekSetupEnd extends StatelessWidget {
  const WeekSetupEnd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      const Text('All done'),
      FloatingActionButton.extended(
        label: const Text('All done'),
        backgroundColor: Colors.blue.shade200,
        icon: const Icon(
          Icons.done,
          size: 24.0,
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MyHomePage(title: 'exercise')));
        },
      )
    ]));
  }
}
