import 'dart:convert';
import '../dio.dart';
import 'package:dio/dio.dart' as Dio;
import '../models/exercise_model.dart';

class ExerciseListing {
  Future<List<dynamic>> getAllExercises() async {
    List<dynamic> data = [];

    Dio.Response response = await dio()
        .get("list/exercises", options: Dio.Options(headers: {'auth': true}));
    data = json.decode(response.data);
    return data;
  }
}

class SaveExercises {
  void save(List<ExerciseModel> data) async {
    List<int> placeholder = [];

    data.forEach((element) => print(element));

    data.forEach((element) {
      print(element.id);
      print(element.id);
    });

    // final response = await dio().post('/saveDay',
    //     options: Dio.Options(headers: {'auth': true}), data: json.encode(data));

    // print(response.data);

    // print(data[0].id);
  }
}
