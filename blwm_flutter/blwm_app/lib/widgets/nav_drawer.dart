import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';
import '../auth/login_screen.dart';
import '../auth/register_screen.dart';
import 'package:blwm_app/setup_exercises/exercise_setup.dart';
import 'package:blwm_app/widgets/color_custom_pallette.dart';
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
                color: Palette.evergreen,
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo_new_white.png',
                    height: 130,
                    width: 230,
                  ),
                ],
              ),
            ),
            Card(
              elevation: 5,
              // shadowColor: Palette.freshMint,
              child: ListTile(
                  title: Text(
                    "Hello" + ' ${auth.user.email}',
                    style: TextStyle(color: Palette.evergreen),
                  ),
                  leading: const Icon(Icons.home),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyHomePage(
                                  title: 'my routine app',
                                )));
                  }),
            ),
            Card(
              elevation: 5,
              // shadowColor: Palette.freshMint,
              child: ListTile(
                title: const Text('View today'),
                leading: const Icon(Icons.calendar_month),
                onTap: () {},
              ),
            ),
            Card(
              elevation: 5,
              // shadowColor: Palette.freshMint,
              child: ListTile(
                title: const Text('Edit routine'),
                leading: const Icon(Icons.edit),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ExerciseSetup()));
                },
              ),
            ),
            Card(
              elevation: 5,
              // shadowColor: Palette.freshMint,

              child: ListTile(
                title: const Text('View weekly exercises'),
                leading: const Icon(Icons.view_agenda),
                onTap: () {},
              ),
            ),
            Card(
              elevation: 5,
              // shadowColor: Palette.freshMint,
              child: ListTile(
                title: const Text('Logout'),
                leading: const Icon(Icons.logout),
                onTap: () {
                  Provider.of<Auth>(context, listen: false).logout();
                },
              ),
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
