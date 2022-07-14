import 'package:blwm_app/screen/posts-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../screen/login-screen.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const ListTile(title: Text('User name')),
          ListTile(title: const Text('Posts'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PostsScreen()));
            },
          ),
           ListTile(title: const Text('Login'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
          ),
        ],
      ),
    );
  }
}
