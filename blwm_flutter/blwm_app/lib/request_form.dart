import 'dart:html';

import 'package:flutter/material.dart';

// Define a custom Form widget.
class RequestForm extends StatefulWidget {
  const RequestForm({super.key});

  @override
  RequestFormState createState() {
    return RequestFormState();
  }
}

class RequestFormState extends State<RequestForm> {
  final _requestFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create a Placement'),
        ),
        body: Container(
            padding: const EdgeInsets.all(20.0),
            child: Form(
                key: _requestFormKey,
                child: ListView(children: <Widget>[
                  TextFormField(
                      key: _requestFormKey,
                      decoration: const InputDecoration(
                          hintText: 'e.g. Key Stage 1',
                          labelText: 'Key Stage:')),
                  TextFormField(
                      key: _requestFormKey,
                      decoration: const InputDecoration(
                          hintText: 'e.g. Maths', labelText: 'Subject:')),
                  TextFormField(
                      key: _requestFormKey,
                      decoration: const InputDecoration(
                          hintText: 'School Name & Address',
                          labelText: 'Location:')),
                  TextFormField(
                      key: _requestFormKey,
                      decoration: const InputDecoration(
                          hintText: 'e.g. 12/09/2022', labelText: 'Dates:')),
                  TextFormField(
                      key: _requestFormKey,
                      decoration: const InputDecoration(
                          hintText: 'e.g. 8:40am', labelText: 'Arrival Time:')),
                  TextFormField(
                      key: _requestFormKey,
                      decoration: const InputDecoration(
                          hintText: 'e.g. 3:30pm',
                          labelText: 'Departure Time:')),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed:
                          () {}, //post req that sends the job req to the backend
                      child: Text(
                          key: _requestFormKey,
                          'Create Placement',
                          style: const TextStyle(color: Colors.blue)),
                    ),
                  )
                ]))));
  }
}
