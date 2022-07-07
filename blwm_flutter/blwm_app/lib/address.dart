import 'dart:convert';
import 'package:http/http.dart' as http;

class Address {
  String baseUrl = "http://10.0.2.2:8000/api/address/show";
  Future<http.Response> getAddress() async {
    return http.get(Uri.parse(baseUrl));
  }
}
