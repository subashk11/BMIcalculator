import 'package:flutter/cupertino.dart';
import 'dart:math';

class Bmicalculation {
  Bmicalculation({@required this.height, @required this.weight});

  final int height;
  final int weight;

  double bmi;

  String calculation() {
    bmi = weight / pow(height / 100, 2);
  }

  String Results() {
    if (bmi >= 25) {
      return 'OverWight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Under Weight';
    }
  }

  String Interpretation() {
    if (bmi >= 25) {
      return 'Exercise More';
    } else if (bmi > 18.5) {
      return 'Good Job.Have A Normal Body';
    } else {
      return 'Gain Weight';
    }
  }
}
