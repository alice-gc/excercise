import 'package:flutter/material.dart';

// Define a custom Form widget.
class RequestForm extends StatefulWidget {
  const RequestForm({super.key});

  @override
  RequestFormState createState() {
    return RequestFormState();
  }
}

enum KeyStage { keystage1, keystage2, keystage3, keystage4 }

class RequestFormState extends State<RequestForm> {
  final _requestFormKey = GlobalKey<FormState>();

  KeyStage? _keystage = KeyStage.keystage1;

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
                  ListTile(
                    // TODO: make into dropdowns
                    title: const Text('Key Stage 1'),
                    leading: Radio<KeyStage>(
                        value: KeyStage.keystage1,
                        groupValue: _keystage,
                        onChanged: (KeyStage? value) {
                          setState(() {
                            _keystage = value;
                          });
                        }),
                  ),
                  ListTile(
                    title: const Text('Key Stage 2'),
                    leading: Radio<KeyStage>(
                        value: KeyStage.keystage2,
                        groupValue: _keystage,
                        onChanged: (KeyStage? value) {
                          setState(() {
                            _keystage = value;
                          });
                        }),
                  ),
                  ListTile(
                    title: const Text('Key Stage 3'),
                    leading: Radio<KeyStage>(
                        value: KeyStage.keystage3,
                        groupValue: _keystage,
                        onChanged: (KeyStage? value) {
                          setState(() {
                            _keystage = value;
                          });
                        }),
                  ),
                  ListTile(
                    title: const Text('Key Stage 4'),
                    leading: Radio<KeyStage>(
                        value: KeyStage.keystage4,
                        groupValue: _keystage,
                        onChanged: (KeyStage? value) {
                          setState(() {
                            _keystage = value;
                          });
                        }),
                  ),
                  TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'e.g. Maths', labelText: 'Subject:')),
                  TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'School Name & Address',
                          labelText: 'Location:')),
                  TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'e.g. 12/09/2022', labelText: 'Dates:')),
                  TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'e.g. 8:40am', labelText: 'Arrival Time:')),
                  TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'e.g. 3:30pm',
                          labelText: 'Departure Time:')),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed:
                          () {}, //post req that sends the job req to the backend
                      child: const Text('Create Placement',
                          style: TextStyle(color: Colors.white)),
                    ),
                  )
                ]))));
  }
}
