// @dart=2.9
import 'package:flutter/material.dart';
import 'package:kalpas_test/enums/values.dart';

import 'input_form.dart';

class Splash extends StatelessWidget {
  const Splash({
    Key key,
    @required this.pageType,
  }) : super(key: key);

  final PageType pageType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.red,
            child: SafeArea(child: Text('Welcome')),
          ),
          Container(
            height: 600,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(80),
                topRight: Radius.circular(80),
              ),
              color: Colors.white,
            ),
            child: Container(
              padding: EdgeInsets.all(20),
              child: (pageType == PageType.SignIn)
                  ? InputForm(caption: 'Sign In', isSignIn: true)
                  : InputForm(caption: 'Sign Up', isSignIn: false),
            ),
          )
        ],
      ),
    );
  }
}
