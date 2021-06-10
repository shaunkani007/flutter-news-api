// @dart=2.9
import 'package:flutter/material.dart';

class BottomNavButton extends StatelessWidget {
  const BottomNavButton(
      {Key key,
      @required this.onPressed,
      @required this.displayText,
      @required this.icon,
      @required this.isSelected,
      @required this.inactiveIconColor})
      : super(key: key);

  final Function onPressed;
  final String displayText;
  final IconData icon;
  final bool isSelected;
  final Color inactiveIconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Material(
        elevation: 2,
        child: Container(
          // height: double.infinity,
          padding: EdgeInsets.all(17),
          decoration: isSelected
              ? BoxDecoration(
                  color: Colors.blue[600],
                  borderRadius: BorderRadius.circular(10))
              : BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              isSelected
                  ? Icon(
                      icon,
                      size: 40,
                      color: Colors.white,
                    )
                  : Icon(
                      icon,
                      size: 40,
                      color: inactiveIconColor,
                    ),
              SizedBox(width: 10),
              isSelected
                  ? Text(
                      displayText,
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    )
                  : Text(
                      displayText,
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
