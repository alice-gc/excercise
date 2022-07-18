import 'package:blwm_app/screen/posts-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../screen/login-screen.dart';
import '../screen/register-screen.dart';


class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(child: Consumer<Auth>(
      builder: (context, auth, child) {
        if (auth.authenticated) {
          return ListView(
            children: [
             DrawerHeader(
              decoration: const BoxDecoration(
              color: Colors.blue,
            ),
              child: Column(
                children: const [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                    radius: 30,
                     ),
                    SizedBox(height: 10,),
                    Text('title title', style: 
                    TextStyle(color: Colors.white),),
                    SizedBox(height: 10,),
                    Text('subtitle subtitle', style: 
                    TextStyle(color: Colors.white),),
                ],
              ),
            ),
            const ListTile(
              title: Text('User name'),
            ),
            ListTile(
              title: const Text('Posts'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PostsScreen()));
              },
            ),
            ListTile(
              title: const Text('Logout'),
              leading: Icon(Icons.logout),
              onTap: () {
                Provider.of<Auth>(context, listen: false).logout();
              },
            ),
          ]);
        } else {
          return ListView(
            children: [

             DrawerHeader(
              decoration: const BoxDecoration(
              color: Colors.blue,
            ),
              child: Column(
                children: const [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                    radius: 30,
                     ),
                    SizedBox(height: 10,),
                    Text('title title', style: 
                    TextStyle(color: Colors.white),),
                    SizedBox(height: 10,),
                    Text('subtitle subtitle', style: 
                    TextStyle(color: Colors.white),),
                ],
              ),
            ),

              ListTile(
                  title: Text('Login'),
                  leading: Icon(Icons.login),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  LoginScreen()));
                  }),
              ListTile(
                  title: Text('Register'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  RegisterScreen()));
                  })
            ],
          );
        }
      },
    ));
  }
}
