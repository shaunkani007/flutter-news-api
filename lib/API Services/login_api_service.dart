// @dart=2.9
import 'package:http/http.dart' as http;
import 'package:kalpas_test/models/login_model.dart';
import 'dart:convert';

class LoginApiService {
  Future<LoginModel> makeRequest() async {
    var client = http.Client();
    var loginModel = null;
    try {
      var url =
          Uri.parse('https://nodejs-register-login-app.herokuapp.com/login');
      print('Parsing');
      var response = await client
          .post(url, body: {"email": "abcd@gmail.com", "password": "test"});
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
