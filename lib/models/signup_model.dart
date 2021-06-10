//@dart=2.9
// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
    SignUpModel({
        this.success,
    });

    String success;

    factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        success: json["Success"] == null ? null : json["Success"],
    );

    Map<String, dynamic> toJson() => {
        "Success": success == null ? null : success,
    };
}
