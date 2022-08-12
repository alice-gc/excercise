import 'package:flutter/material.dart';

class Day extends StatelessWidget {
  final String dayText;

  Day(this.dayText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Text(
        dayText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
