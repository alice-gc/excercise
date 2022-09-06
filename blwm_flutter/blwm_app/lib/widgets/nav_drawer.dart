import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';
import '../auth/login_screen.dart';
import '../auth/register_screen.dart';
import 'package:blwm_app/setup_exercises/exercise_setup.dart';
import '../main.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(child: Consumer<Auth>(
      builder: (context, auth, child) {
        if (auth.authenticated) {
          return ListView(children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Hello ' + auth.user.email,
                    style: const TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            ListTile(
                title: Text(
                  ' ${auth.user.email}',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage(
                                title: 'my routine app',
                              )));
                }),
            ListTile(
              title: const Text('Setup/edit my routine'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ExerciseSetup()));
              },
            ),
            ListTile(
              title: const Text('Logout'),
              leading: const Icon(Icons.logout),
              onTap: () {
                Provider.of<Auth>(context, listen: false).logout();
              },
            ),
          ]);
        } else {
          return ListView(
            children: [
              ListTile(
                  title: const Text('Login'),
                  leading: Icon(Icons.login),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  }),
              ListTile(
                  title: const Text('Register'),
                  leading: const Icon(Icons.assignment),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterScreen()));
                  })
            ],
          );
        }
      },
    ));
  }
}
