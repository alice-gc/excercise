// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;

  void submit() {
    log(_email);
    log(_password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
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
                    SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          child: Text('Login'),
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
