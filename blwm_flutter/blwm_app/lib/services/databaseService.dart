import 'dart:convert';
import '../dio.dart';
import 'package:dio/dio.dart' as Dio;

class ExerciseListing {
  Future<List<dynamic>> getAllExercises() async {
    List<dynamic> data = [];

    Dio.Response response = await dio()
        .get("list/exercises", options: Dio.Options(headers: {'auth': true}));

    data = json.decode(response.data);

    return data;
  }
}
