// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:kalpas_test/API%20Services/login_api_service.dart';
import 'package:kalpas_test/API%20Services/signup_api_service.dart';
import 'package:kalpas_test/models/login_model.dart';
import 'package:get/get.dart';
import 'package:kalpas_test/models/signup_model.dart';
import 'package:kalpas_test/presentation/screens/home_page.dart';
import 'package:kalpas_test/presentation/screens/news_tab.dart';

class SignInSignOutButton extends StatelessWidget {
  const SignInSignOutButton({Key key, @required this.displayLabel})
      : super(key: key);

  final String displayLabel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: signInSignUpPressed,
      child: Container(
        width: 140,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.blue[300],
            borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Center(
          child: Text(
            displayLabel,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  void signInSignUpPressed() async {
    if (this.displayLabel == 'Sign In') {
      LoginModel output = await LoginApiService().makeRequest();
      print(output.success);
      if (output.success == 'Success!') {
        var snackbar = GetBar(message: 'Signing in, wait a moment');
        Get.showSnackbar(snackbar);
        await Future.delayed(Duration(seconds: 2));
        Get.offAll(() => HomePage());
      } else if (output.success == 'Wrong Password!') {
        print('Incorrect Password');
      }
    } else {
      SignUpModel output = await SignUpApiService().makeRequest();
      print(output.success);
      if (output.success == 'You are regestered,You can login now.') {
        var snackbar = GetBar(message: 'Signing in, wait a moment');
        Get.showSnackbar(snackbar);
        await Future.delayed(Duration(seconds: 2));
        Get.offAll(() => HomePage());
      }
    }
  }
}
