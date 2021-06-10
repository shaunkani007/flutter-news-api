// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalpas_test/presentation/screens/home_page.dart';
import 'package:kalpas_test/presentation/screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState(){
    checkIfAlreadyLogin();
    super.initState();
  }

  SharedPreferences loginData;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        // body: NewsTab(),
        body: LoginPage(),
        // persistentFooterButtons: [
        //   ElevatedButton(onPressed: () {}, child: Text('News')),
        //   ElevatedButton(onPressed: () {}, child: Text('Favorites'))
        // ],
      ),
    );
  }

  void checkIfAlreadyLogin() async {
    loginData = await SharedPreferences.getInstance();
    var newUser = (loginData.getBool('login') ?? true);

    print(newUser);
    if (newUser == false) {
      Get.offAll(HomePage());
    }
  }
}
