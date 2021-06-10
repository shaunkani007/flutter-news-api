// @dart=2.9
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kalpas_test/models/login_model.dart';
import 'dart:convert';

class LoginApiService {
  String email;
  String password;

  void changeEmail(String newEmail) {
    email = newEmail;
  }

  void changePassword(String newPassword) {
    password = newPassword;
  }

  Future<LoginModel> makeRequest() async {
    var client = http.Client();
    var loginModel = null;
    try {
      var url =
          Uri.parse('https://nodejs-register-login-app.herokuapp.com/login');
      print('Parsing');
      print(email);
      var response =
          await client.post(url, body: {"email": email, "password": password});
      //For testing already registered user - abcd@gmail.com , test
      if (response.statusCode == 200) {
        print('Good');
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        loginModel = LoginModel.fromJson(jsonMap);
      }
      return loginModel;
    } catch (e) {
      return loginModel;
    } finally {
      client.close();
    }
  }
}
