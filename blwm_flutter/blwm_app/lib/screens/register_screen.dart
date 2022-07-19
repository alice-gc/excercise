// ignore_for_file: avoid_print

import 'dart:developer';
import 'package:blwm_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RegisterState();
  }
}

class RegisterState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;
  late int _custom_role_id;

  String dropDownValue = 'Teacher';
  var roles = [
    'Teacher',
    'School',
  ];

  int getRoleIdFromSelection(String selection) {
    if (selection == 'Teacher') {
      return 1;
    }
    return 2;
  }

  void submit() {
    try {
      // Register user first
      _custom_role_id = getRoleIdFromSelection(dropDownValue);
      
      Provider.of<Auth>(context, listen: false).register(credentials: {
        'email': _email,
        'password': _password,
        'custom_role_id': _custom_role_id
      });

      // Login new user
      Provider.of<Auth>(context, listen: false)
          .login(credentials: {'email': _email, 'password': _password});
    } catch (e) {
      log(e.toString());
    }

    Navigator.pop(context);

    log(_email);
    log(_password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Form(
        key: _formKey,
        child: Scrollbar(
            child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'you@somewhere.com',
                        ),
                        onSaved: (value) {
                          _email = value!;
                        }),
                    TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Password'),
                        onSaved: (value) {
                          _password = value!;
                        }),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text('Role :   ',
                            style:
                                TextStyle(color: Colors.black, fontSize: 17)),
                        DropdownButton(
                          // Initial Value
                          value: dropDownValue,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: roles.map((String roles) {
                            return DropdownMenuItem(
                              value: roles,
                              child: Text(roles),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownValue = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                                width: 0.5, color: Colors.black),
                            shape: const StadiumBorder(),
                          ),
                          child: const Text('Sign up',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18)),
                          onPressed: () {
                            _formKey.currentState!.save();

                            submit();
                          },
                        ))
                  ],
                ))),
      ),
    );
  }
}
