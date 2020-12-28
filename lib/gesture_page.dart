import 'package:flutter/material.dart';
import 'constants.dart';

class Gesturedetect extends StatelessWidget {
  Gesturedetect({@required this.onTap, @required this.TextValue});

  final Function onTap;
  final String TextValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(10.0),
        height: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Color(0xFFEB1555),
        ),
        child: Center(
          child: Text(
            TextValue,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
