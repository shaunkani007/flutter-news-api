// @dart=2.9
// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        this.success,
    });

    String success;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        success: json["Success"] == null ? null : json["Success"],
    );

    Map<String, dynamic> toJson() => {
        "Success": success == null ? null : success,
    };
}
