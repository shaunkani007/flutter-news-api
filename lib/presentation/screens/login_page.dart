// @dart=2.9

import 'package:flutter/material.dart';
import 'package:kalpas_test/API%20Services/login_api_service.dart';
import 'package:kalpas_test/enums/values.dart';
import 'package:kalpas_test/presentation/ui_components/splash.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key}) : super(key: key);

  final loginController = Get.put(LoginApiService());
  @override
  Widget build(BuildContext context) {
    return Splash(
      pageType: PageType.SignIn,
    );
  }
}
