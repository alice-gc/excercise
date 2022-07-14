import 'package:blwm_app/widgets/nav-drawer.dart';
import 'package:flutter/material.dart';

import 'package:blwm_app/request_form.dart';
import 'package:blwm_app/school.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School Name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Blwm'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  School schoolService = School();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: NavDrawer(),
        body: const Center(
              child: Text('You are not loged in'),
              // Positioned(
              //   bottom: 0,
              //   width: MediaQuery.of(context).size.width,
              //   child: Center(
              //     child: ElevatedButton.icon(
              //       onPressed: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => const RequestForm()),
              //         );
              //       },
              //       icon: const Icon(
              //         Icons.add,
              //         size: 24.0,
              //       ),
              //       label: const Text('Create Placement'),
              //     ),
              //   ),
              // ),    
        ));
  }
}
