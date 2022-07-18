// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:blwm_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  // const LoginScreen({Key? key}) : super(key: key);

  @override
  // State<StatefulWidget> createState() {
  //   return LoginState();
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                        controller: _emailController,
                        validator: (value) =>
                            value!.isEmpty ? 'please enter valid email' : null,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'you@somewhere.com',
                        ),
                        onSaved: (value) {
                          _email = value!;
                        }),
                    TextFormField(
                        controller: _passwordController,
                        validator: (value) => value!.isEmpty
                            ? 'please enter valid password'
                            : null,
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
                            // _formKey.currentState!.save();

                            // submit();

                            Map credentials = {
                              'email': _emailController.text,
                              'password': _passwordController.text,
                              'device': "token?",
                            };

                            if (_formKey.currentState!.validate()) {
                              Provider.of<Auth>(context, listen: false)
                                  .login(credentials: credentials);

                              Navigator.pop(context);
                            }
                          },
                        ))
                  ],
                ))),
      ),
    );
  }
}
