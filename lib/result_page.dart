import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import 'constants.dart';
import 'gesture_page.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.Value, this.PrintText, this.InterpretationText});
  final String PrintText;
  final String Value;
  final String InterpretationText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Center(
                  child: Text(
                    'Your Result',
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Color(0xFF8D8E98),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                color: containerColour,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Value,
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.lightGreenAccent,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      PrintText.toString(),
                      style: Numberconstant,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      InterpretationText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Gesturedetect(
                onTap: () {
                  Navigator.pop(context);
                },
                TextValue: 'RE-CALCULATE',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
