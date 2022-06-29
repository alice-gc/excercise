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
          child: ListView(
            children: <Widget>[
              TextFormField(
                  decoration: InputDecoration(labelText: 'Key Stage:')),
              TextFormField(decoration: InputDecoration(labelText: '')),
              Container(
                width: screenSize.width,
                child: ElevatedButton(
                  child: Text(
                    'Login',
                    style: const TextStyle(color: Colors.white),
                  ),
                  onPressed: () => null,
                  color: Colors.blue,
                ),
                margin: const EdgeInsets.only(top: 20.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
