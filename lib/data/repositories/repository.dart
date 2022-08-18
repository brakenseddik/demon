import 'dart:convert';
import 'dart:developer';

import 'package:demon/domain/repositories/repository.dart';
import 'package:http/http.dart' as http;

class Repository extends IRepository {
  @override
  Future login(String email, String password) async {
    log('email: $email, password: $password');
    const url = 'https://api-nodejs-todolist.herokuapp.com/user/login';
    try {
      final res = await http.post(Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'email': email,
            'password': password,
          }));

      log(res.body.toString());
      if (res.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      log(e.toString());

      rethrow;
    }
  }
}
