import 'package:blwm_app/school.dart';
import 'package:blwm_app/send_request_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

@override
Widget build(BuildContext context) {
  return const MaterialApp(
    title: 'Request a Supply Teacher',
    debugShowCheckedModeBanner: false,
    home: RequestForm(),
  );
}

class RequestForm extends StatefulWidget {
  const RequestForm({Key? key}) : super(key: key);

  @override
  State<RequestForm> createState() {
    return _RequestFormState();
  }
}

class _RequestFormState extends State<RequestForm> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _keystageHasError = false;
  bool _subjectHasError = false;

  var keystageOptions = [
    'Keystage 1',
    'Keystage 2',
    'Keystage 3',
    'Keystage 4'
  ];

  var subjectOptions = [
    'English',
    'Mathematics',
    'Biology',
    'Chemistry',
    'Physics',
    'History',
    'Geography',
    'Modern Foreign Languages',
    'DT',
    'ICT',
    'Art & Design',
    'Music',
    'PE',
    'RE'
  ];

  final now = DateTime.now();

  void _onChanged(dynamic val) => debugPrint(val.toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Input Details of Placement')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FormBuilder(
                key: _formKey,
                // enabled: false,
                onChanged: () {
                  _formKey.currentState!.save();
                  debugPrint(_formKey.currentState!.value.toString());
                },
                autovalidateMode: AutovalidateMode.disabled,
                initialValue: {
                  'dates': DateFormat('EEE d MMM').format(DateTime.now())
                },
                skipDisabled: true,
                child: Column(
                  children: <Widget>[
                    const SizedBox(width: 20),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          _formKey.currentState?.reset();
                        },
                        child: Text(
                          'Reset',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    FormBuilderDropdown<String>(
                      name: 'keystage',
                      decoration: InputDecoration(
                        labelText: 'Keystage',
                        suffix: _keystageHasError
                            ? const Icon(Icons.error)
                            : const Icon(Icons.check_circle),
                      ),
                      allowClear: true,
                      hint: const Text('Select Keystage'),
                      validator: FormBuilderValidators.compose(
                          [FormBuilderValidators.required()]),
                      items: keystageOptions
                          .map((keystage) => DropdownMenuItem(
                                alignment: AlignmentDirectional.center,
                                value: keystage,
                                child: Text(keystage),
                              ))
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          _keystageHasError = !(_formKey
                                  .currentState?.fields['keystage']
                                  ?.validate() ??
                              false);
                        });
                      },
                      valueTransformer: (val) => val?.toString(),
                    ),
                    FormBuilderDropdown<String>(
                      // autovalidate: true,
                      name: 'subject',
                      decoration: InputDecoration(
                        labelText: 'Subject',
                        suffix: _subjectHasError
                            ? const Icon(Icons.error)
                            : const Icon(Icons.check),
                      ),
                      allowClear: true,
                      hint: const Text('Select Subject'),
                      validator: FormBuilderValidators.compose(
                          [FormBuilderValidators.required()]),
                      items: subjectOptions
                          .map((subject) => DropdownMenuItem(
                                alignment: AlignmentDirectional.center,
                                value: subject,
                                child: Text(subject),
                              ))
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          _subjectHasError = !(_formKey
                                  .currentState?.fields['keystage']
                                  ?.validate() ??
                              false);
                        });
                      },
                      valueTransformer: (val) => val?.toString(),
                    ),
                    FormBuilderFilterChip<dynamic>(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(labelText: 'Dates'),
                      name: 'dates',
                      options: [
                        FormBuilderChipOption(
                          value: DateFormat('EEE d MMM').format(now),
                        ),
                        FormBuilderChipOption(
                          value: DateFormat('EEE d MMM')
                              .format(now.add(const Duration(days: 1))),
                        ),
                        FormBuilderChipOption(
                          value: DateFormat('EEE d MMM')
                              .format(now.add(const Duration(days: 2))),
                        ),
                        FormBuilderChipOption(
                          value: DateFormat('EEE d MMM')
                              .format(now.add(const Duration(days: 3))),
                        ),
                        FormBuilderChipOption(
                          value: DateFormat('EEE d MMM')
                              .format(now.add(const Duration(days: 4))),
                        ),
                      ],
                      onChanged: _onChanged,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.minLength(1),
                        FormBuilderValidators.maxLength(5),
                      ]),
                    ),
                    Row(children: <Widget>[
                      const SizedBox(width: 20),
                      Expanded(
                        child: FormBuilderDateTimePicker(
                          name: 'arrivalTime',
                          initialValue: DateTime.now(),
                          inputType: InputType.time,
                          decoration: InputDecoration(
                            labelText: 'Arrival Time',
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                _formKey.currentState!.fields['date']
                                    ?.didChange(null);
                              },
                            ),
                          ),
                          initialTime: const TimeOfDay(hour: 8, minute: 0),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: FormBuilderDateTimePicker(
                          name: 'departureTime',
                          initialValue: DateTime.now(),
                          inputType: InputType.time,
                          decoration: InputDecoration(
                            labelText: 'Departure Time',
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                _formKey.currentState!.fields['date']
                                    ?.didChange(null);
                              },
                            ),
                          ),
                          initialTime: const TimeOfDay(hour: 8, minute: 0),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          debugPrint(_formKey.currentState?.value.toString());
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SendRequestForm()),
                          );
                        } else {
                          debugPrint(_formKey.currentState?.value.toString());
                          debugPrint('validation failed');
                        }
                      },
                      child: const Text(
                        'Request',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
