import 'dart:developer';
import 'package:flutter/material.dart';

class TeacherHomeScreen extends StatefulWidget {
  @override

  _TeacherHomeScreenState createState() => _TeacherHomeScreenState(); 

}

class _TeacherHomeScreenState extends State<TeacherHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(child: Text ('Welcome Teacher', style: TextStyle(color: Colors.black,fontSize: 22)),
      ),

    );
}
}