import 'package:blwm_app/services/auth.dart';
import 'package:blwm_app/widgets/buttons/recommended_exercise_button.dart';
import 'package:blwm_app/widgets/buttons/custom_exercise_button.dart';
import 'package:blwm_app/widgets/nav_drawer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'exercise'),
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
  final storage = const FlutterSecureStorage();

  void _attemptAuthenication() async {
    final key = await storage.read(key: 'auth');
    Provider.of<Auth>(this.context, listen: false).attempt(key!);
  }

  @override
  void initState() {
    _attemptAuthenication();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: const NavDrawer(),
        body: Center(child: Consumer<Auth>(builder: (context, auth, child) {
          if (auth.authenticated) {
            //main screen
            return Column(children: const [
              RecommendedButton(),
              CustomButton(),
            ]);
          } else {
            return const Text('Please Login / Register to continue',
                style: TextStyle(color: Colors.black, fontSize: 22));
          }
        })));
  }
}
