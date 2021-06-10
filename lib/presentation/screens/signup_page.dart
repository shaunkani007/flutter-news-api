// @dart=2.9
import 'package:flutter/material.dart';
import 'package:kalpas_test/API%20Services/signup_api_service.dart';
import 'package:kalpas_test/enums/values.dart';
import 'package:kalpas_test/presentation/ui_components/splash.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key key}) : super(key: key);

  final signUpService = Get.put(SignUpApiService());

  @override
  Widget build(BuildContext context) {
    return Splash(
      pageType: PageType.SignUp,
    );
  }
}
