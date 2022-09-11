import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:blwm_app/services/auth.dart';
import 'package:blwm_app/widgets/nav_drawer.dart';
import 'package:blwm_app/widgets/color_custom_pallette.dart';
import 'package:blwm_app/screens/home_screen_auth.dart';
import 'package:blwm_app/screens/home_screen_unauth.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // setup theme for the app
      theme: ThemeData(
        // Define the default brightness and colors.
        // dark and light mode
        brightness: Brightness.light,
        // custom primary swatch
        primarySwatch: generateMaterialColor(Palette.evergreen),

        // Define the default font family.
        // textTheme: GoogleFonts.kreonTextTheme(),
      ),
      home: const MyHomePage(title: 'Cup of Calisthenic'),
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

// check if user is authenticated
// and load proper widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text(widget.title)),
        drawer: const NavDrawer(),
        body: Center(child: Consumer<Auth>(builder: (context, auth, child) {
          if (auth.authenticated) {
            return AuthHomeScreen();
          } else {
            return UnAuthHomeScreen();
          }
        })));
  }
}
