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

  Future<List<dynamic>> checkForExercises() async {
    List<dynamic> data;

    Dio.Response response = await dio().get("checkForExercises",
        options: Dio.Options(headers: {'auth': true}));

    data = json.decode(response.data);

    // print(data);

    return data;
  }

  Future<List<dynamic>> getAllForUser() async {
    List<dynamic> data;

    Dio.Response response = await dio().get("/list/exercises/user",
        options: Dio.Options(headers: {'auth': true}));

    data = json.decode(response.data);

    print(data);

    return data;
  }
}

class ExerciseListingByDay {
  Future<List<dynamic>> getByDayExercises(String day) async {
    List<dynamic> data = [];
    Map send_data = {'day': day};

    // print(send_data);

    Dio.Response response = await dio().post("list/exercises/byDay",
        options: Dio.Options(headers: {'auth': true}),
        data: json.encode(send_data));

    data = json.decode(response.data);

    return data;
  }

  void deleteByDayExercises(int index) async {
    Map send_data = {
      'index': index,
    };
    // print(send_data);

    Dio.Response response = await dio().delete("list/exercises/DeletebyDay",
        options: Dio.Options(headers: {'auth': true}),
        data: json.encode(send_data));
    // print(response.data);
  }
}

class SaveExercises {
  void saveToDay(List<ExerciseModel> data, String day) async {
    Map send_data = {};

    int i = 0;
    data.forEach((element) {
      send_data[i.toString()] = element.id.toString();
      i = i + 1;
    });

    send_data["day"] = day;

    print('placeholder');
    print(json.encode(send_data));

    final response = await dio().post('/saveDay',
        options: Dio.Options(headers: {'auth': true}),
        data: json.encode(send_data));

    print(response.data);
  }

  void init() async {
    Dio.Response response = await dio()
        .post("/save/init", options: Dio.Options(headers: {'auth': true}));
    // print(response.data);
  }

  void addCustomExercise(String name, String desc) async {
    List<dynamic> data = [];
    Map send_data = {
      'name': name,
      'desc': desc,
    };

    // print(send_data);

    Dio.Response response = await dio().post("list/exercises/addCustomExercise",
        options: Dio.Options(headers: {'auth': true}),
        data: json.encode(send_data));
  }
}
