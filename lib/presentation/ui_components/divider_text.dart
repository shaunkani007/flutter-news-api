// @dart=2.9
import 'package:flutter/material.dart';

class DividerText extends StatelessWidget {
  const DividerText({
    Key key,
    @required this.midText,
  }) : super(key: key);

  final String midText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Divider(
          thickness: 2,
        )),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Text(
            midText,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
            child: Divider(
          thickness: 2,
        ))
      ],
    );
  }
}