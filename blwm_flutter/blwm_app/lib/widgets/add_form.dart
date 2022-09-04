import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../services/databaseService.dart';

class AddForm extends StatefulWidget {
  const AddForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AddFormState();
  }
}

class _AddFormState extends State<AddForm> {
  late String _name;
  late String _desc;

  SaveExercises databaseService = SaveExercises();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildNameField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Exercise Name'),
      validator: (value) {
        if (value!.isEmpty) {
          return 'name is Required';
        }
      },
      onSaved: (value) {
        _name = value!;
      },
    );
  }

  Widget _buildDescriptionField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Description Name'),
      validator: (value) {
        if (value!.isEmpty) {
          return 'description is Required';
        }
      },
      onSaved: (value) {
        _desc = value!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: const Text('Input Details of your custom Exercise')),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildNameField(),
                      _buildDescriptionField(),
                      const SizedBox(height: 100),
                      ElevatedButton(
                          child: const Text(
                            'Submit',
                          ),
                          onPressed: () async {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            _formKey.currentState!.save();
                            print(_name);
                            print(_desc);

                            databaseService.addCustomExercise(
                              _name,
                              _desc,
                            );

                            Navigator.pop(context);
                          }),
                    ],
                  ))),
        ));
  }
}
