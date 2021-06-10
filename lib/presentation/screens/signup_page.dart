// @dart=2.9
import 'package:flutter/material.dart';
import 'package:kalpas_test/enums/values.dart';
import 'package:kalpas_test/presentation/ui_components/splash.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Splash(
      pageType: PageType.SignUp,
    );
  }
}