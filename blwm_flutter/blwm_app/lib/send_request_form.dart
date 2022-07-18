import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/';

@override
Widget build(BuildContext context) {
  return const MaterialApp(
    title: 'Send Request',
    debugShowCheckedModeBanner: false,
  );
}

class SendRequestForm extends StatefulWidget {
  const SendRequestForm({Key? key}) : super(key: key);

  @override
  State<SendRequestForm> createState() {
    return _SendRequestFormState();
  }
}

class _SendRequestFormState extends State<SendRequestForm> {
  

  final snackBar = SnackBar(
    content: const Text('Request Created'),
    action: SnackBarAction(
    label: 'Return to Dashboard',
    onPressed: () {
    Navigator.push(
    context,
      MaterialPageRoute(
      builder: (context) => const MyHomePage(
      title: 'Home',
      )));
    },
  ),
);

Future<Request> createRequest(String title) async {
  final http.Response response = await http.post(
    Uri.parse(''),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      
    }),
  );

  if (response.statusCode == 201) {
    return Request.fromJson(json.decode(response.body));
  }
}

class 