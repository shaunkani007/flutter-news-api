// @dart=2.9
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField({
    Key key,
    @required this.hintLabel,
    @required this.onChanged,
  }) : super(key: key);

  final String hintLabel;
  final Function onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (value) {
          onChanged(value);
          // if (hintLabel == 'Email:') {
          //   Get.find<LoginApiService>().email = value;
          // }
          // if (hintLabel == 'Password:') {
          //   Get.find<LoginApiService>().password = value;
          // }
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 20),
          fillColor: Colors.green[300],
          filled: true,
          hintText: hintLabel,
          hintStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
      ),
    );
  }
}
