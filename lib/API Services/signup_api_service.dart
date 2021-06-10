// @dart=2.9
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:kalpas_test/models/signup_model.dart';

class SignUpApiService {
  Future<SignUpModel> makeRequest() async {
    var client = http.Client();
    var signUpModel = null;
    try {
      var url = Uri.parse('https://nodejs-register-login-app.herokuapp.com/');
      print('Parsing');
      var response = await client.post(
        url,
        body: {
          "email": "pq@gmail.com",
          "username": "ajodd",
          "password": "test",
          "passwordConf": "test"
        },
      );
      if (response.statusCode == 200) {
        print('Good');
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        signUpModel = SignUpModel.fromJson(jsonMap);
      }
      return signUpModel;
    } catch (e) {
      return signUpModel;
    } finally {
      client.close();
    }
  }
}
