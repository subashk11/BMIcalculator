import 'package:flutter/material.dart';
import 'constants.dart';

class ContentWidget extends StatelessWidget {
  ContentWidget({@required this.Icontype, this.Textitem});

  final IconData Icontype;
  final String Textitem;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icontype,
          size: 100.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          Textitem,
          style: textStyle,
        )
      ],
    );
  }
}
