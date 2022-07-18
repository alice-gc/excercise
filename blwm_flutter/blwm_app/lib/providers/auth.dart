import 'dart:convert';
import 'dart:developer';
// import 'dart:html';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:blwm_app/models/user.dart';
import 'package:platform_device_id/platform_device_id.dart';

import 'package:flutter/widgets.dart';
import '../dio.dart';

class Auth extends ChangeNotifier {
  final storage = new FlutterSecureStorage();

  bool _authenicated = false;
  late User _user;

  bool get authenticated => _authenicated;
  User get user => _user;

  Future login({required Map credentials}) async {
    String? deviceId; 

    try {
        deviceId = await PlatformDeviceId.getDeviceId;
    }catch (e){
      log(e.toString());
    }
    
    
    Dio.Response response = await dio().post(
      'auth/login',
        data: json.encode(credentials..addAll({'deviceID': deviceId}))
        );

    String token = json.decode(response.toString())['token'];
log(token);
    await attempt(token);
    storeToken(token);
  }

  Future register({required Map credentials}) async {
    String? deviceId; 

    try {
        deviceId = await PlatformDeviceId.getDeviceId;
    }catch (e){
      log(e.toString());
    }
    
    
    Dio.Response response = await dio().post('auth/register', data: json.encode(credentials..addAll({'deviceID': deviceId}))
        );

    String token = json.decode(response.toString())['token'];
log(token);
    await attempt(token);
    storeToken(token);
  }

  Future attempt(String token) async {
    try {

      Dio.Response response = await dio().get('auth/user',
          options: Dio.Options(headers: {'Authorization': 'Bearer $token'
          }
          )
      );








      _user = User.fromJson(json.decode(response.toString()));
      _authenicated = true;
    } catch (e) {
      _authenicated = false;
    }
    notifyListeners();
  }

  storeToken(String token) async {
    await storage.write(key: 'auth', value: token);
  }

  Future getToken() async {
    return await storage.read(key: 'auth');
  }

  DeleteToken() async {
    await storage.delete(key: 'auth');
  }

  Future getDeviceId() async {
    String deviceId;

    try {
      deviceId = (await PlatformDeviceId.getDeviceId)!;
      return deviceId;
    } catch (e) {
      //
    }
  }

  void logout() async {
    _authenicated = false;

    await dio().delete('auth/token',
        data: {'deviceId': getDeviceId()},
        options: Dio.Options(headers: {'auth': true}));

    await DeleteToken();

    notifyListeners();
  }
}
