import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:estu_residencia_app/domain/datasources/user_datasource.dart';
import 'package:estu_residencia_app/domain/entities/user.dart';

class TestUserDataSource extends UserDataSource {
  // Utilizar Dio para hacer peticiones HTTP

  @override
  Future<User> getUser() async {
    final String response =
        await rootBundle.loadString('assets/testUserNoValidated.json');
    final data = await json.decode(response);

    return User.fromJson(data);
  }
}
