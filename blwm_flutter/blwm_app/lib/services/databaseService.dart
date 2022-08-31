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

class ExerciseListingByDay {
  Future<List<dynamic>> getByDayExercises(String day) async {
    List<dynamic> data = [];
    Map send_data = {'day': day};

    Dio.Response response = await dio().post("list/exercises/byDay",
        options: Dio.Options(headers: {'auth': true}),
        data: json.encode(send_data));

    data = json.decode(response.data);

    return data;
  }
}

class SaveExercises {
  void saveToDay(List<ExerciseModel> data) async {
    final List<String> placeholder = [];

    data.forEach((element) {
      print(element.id);
      placeholder.add(element.id.toString());
    });

    print('placeholder');
    print(placeholder);

    final response = await dio().post('/saveDay',
        options: Dio.Options(headers: {'auth': true}),
        data: json.encode(placeholder));

    print(response.data);
  }
}
