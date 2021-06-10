// @dart=2.9
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key key,
    @required this.hintLabel,
  }) : super(key: key);

  final String hintLabel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
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
