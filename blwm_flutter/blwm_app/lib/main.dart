import 'package:blwm_app/school.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blwm',
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
      body: Container(
          child: FutureBuilder<List>(
        future: schoolService.getAllSchool(),
        builder: (context, snapshot) {
          print(snapshot.data);
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, i) {
                return Card(
                  child: ListTile(
                    title: Text(
                      snapshot.data![i]['name'],
                      style: TextStyle(fontSize: 30.0),
                    ),
                    subtitle: Text(
                      snapshot.data![i]['address'],
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('No Data Found'),
              );
          }
        },
      ),
    ));
  }
}
