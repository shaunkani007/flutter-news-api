// @dart=2.9
import 'package:flutter/material.dart';
import 'package:kalpas_test/enums/values.dart';
import 'package:kalpas_test/presentation/screens/login_page.dart';
import 'package:kalpas_test/presentation/screens/signup_page.dart';
import 'package:kalpas_test/presentation/ui_components/sign_in_sign_out_button.dart';
import 'package:get/get.dart';

import 'divider_text.dart';
import 'input_field.dart';

class InputForm extends StatelessWidget {
  const InputForm({
    Key key,
    @required this.caption,
    @required this.isSignIn,
  }) : super(key: key);

  final String caption;
  final bool isSignIn;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          caption,
          style: TextStyle(fontSize: 20),
        ),
        Expanded(child: SizedBox()),
        InputField(hintLabel: 'Email:'),
        InputField(hintLabel: 'Password:'),
        !isSignIn ? InputField(hintLabel: 'Confirm Password:') : Container(),
        isSignIn
            ? Align(
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                      color: Colors.blue, decoration: TextDecoration.underline),
                ),
                alignment: Alignment.topRight,
              )
            : Container(),
        Expanded(child: SizedBox()),
        isSignIn
            ? SignInSignOutButton(displayLabel: 'Sign In')
            : SignInSignOutButton(displayLabel: 'Sign Up'),
        Expanded(child: SizedBox()),
        isSignIn
            ? DividerText(midText: 'Or Sign In With')
            : DividerText(midText: 'Or Sign Up With'),
        Expanded(child: SizedBox()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.facebook)),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.facebook,
                color: Colors.blue,
                size: 40,
              ),
            ),
          ],
        ),
        Expanded(child: SizedBox()),
        isSignIn
            ? buildBottomNavRow(
                basicInfo: 'Dont have an account?',
                pageType: PageType.SignUp,
              )
            : buildBottomNavRow(
                basicInfo: 'Already have an account?',
                pageType: PageType.SignIn,
              ),
        Expanded(child: SizedBox()),
      ],
    );
  }

  Row buildBottomNavRow({String basicInfo, PageType pageType}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(basicInfo),
        TextButton(
          onPressed: () {
            switch (pageType) {
              case PageType.SignIn:
                Get.off(() => LoginPage());
                break;
              case PageType.SignUp:
                Get.off(() => SignUpPage());
                break;
            }
          },
          child: Text(PageType.SignIn == pageType ? 'Sign In' : 'Sign Up',
              style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
