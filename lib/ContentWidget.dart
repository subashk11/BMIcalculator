import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  ContainerWidget(
      {@required this.Colour,
      this.containerItems,
      @required Function this.onpress});
  final Color Colour;
  final Widget containerItems;
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: containerItems,
        width: 170.0,
        height: 170.0,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colour,
        ),
      ),
    );
  }
}
