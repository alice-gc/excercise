import 'dart:developer';
import 'package:flutter/material.dart';

class SchoolHomeScreen extends StatefulWidget {
  @override

  _SchoolHomeScreenState createState() => _SchoolHomeScreenState(); 

}

class _SchoolHomeScreenState extends State<SchoolHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(child: Text ('Welcome School', style: TextStyle(color: Colors.black,fontSize: 22)),
      ),

    );
}
}