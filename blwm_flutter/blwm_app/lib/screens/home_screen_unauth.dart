import 'dart:developer';
import 'package:flutter/material.dart';

class UnAuthHomeScreen extends StatefulWidget {
  @override
  _UnAuthHomeScreenState createState() => _UnAuthHomeScreenState();
}

class _UnAuthHomeScreenState extends State<UnAuthHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Text('Please Login / Register to continue',
        style: TextStyle(color: Colors.black, fontSize: 22));
  }
}
