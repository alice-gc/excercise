import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import '../models/post.dart';

import '../dio.dart';

class RecommendedSetup extends StatefulWidget {
  const RecommendedSetup({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RecommendedSetupState();
  }
}

//make a request
class RecommendedSetupState extends State<RecommendedSetup> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommended Setup'),
      ),
      body: Form(
        child: Scrollbar(
            child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                  const Text('Recomended excercise setup',
                style: TextStyle(color: Colors.black, fontSize: 22)),
                
                  FloatingActionButton.extended(
                  label: Text('Next'), // <-- Text
                  backgroundColor: Colors.teal.shade200,
                  onPressed: () {


                      // ListView(
                      //   children: [
                      //     for (var item in items) Text(item),
                      //   ],
                      // );

                  },
                )
                  ],
                ))),
      ),
    );
  }
}
