import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Container_content.dart';
import 'ContentWidget.dart';
import 'constants.dart';
import 'result_page.dart';
import 'gesture_page.dart';
import 'BMI_calculation.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender CurrentGender;
  int height = 150;
  int weight = 40;
  int age = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ContainerWidget(
                    onpress: () {
                      setState(() {
                        CurrentGender = Gender.male;
                      });
                    },
                    Colour: CurrentGender == Gender.male
                        ? startingColour
                        : containerColour,
                    containerItems: ContentWidget(
                      Icontype: FontAwesomeIcons.mars,
                      Textitem: 'MEN',
                    ),
                  ),
                ),
                Expanded(
                  child: ContainerWidget(
                    onpress: () {
                      setState(() {
                        CurrentGender = Gender.female;
                      });
                    },
                    Colour: CurrentGender == Gender.female
                        ? startingColour
                        : containerColour,
                    containerItems: ContentWidget(
                      Icontype: FontAwesomeIcons.venus,
                      Textitem: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 200.0,
                width: double.infinity,
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: containerColour,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: textStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Text(
                          height.toString(),
                          style: Numberconstant,
                        ),
                        Text(
                          'cm',
                          style: textStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 14.0,
                          pressedElevation: 50.0,
                        ),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 100.0,
                        max: 220.0,
                        activeColor: Colors.yellowAccent,
                        inactiveColor: Colors.blueGrey,
                        onChanged: (double HeightValue) {
                          setState(
                            () {
                              height = HeightValue.round();
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: ContainerWidget(
                      Colour: containerColour,
                      containerItems: Column(
                        children: [
                          Text(
                            'WEIGHT',
                            style: textStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: Numberconstant,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              CustomButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ContainerWidget(
                        Colour: containerColour,
                        containerItems: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: textStyle,
                            ),
                            Text(
                              age.toString(),
                              style: Numberconstant,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                CustomButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Gesturedetect(
                onTap: () {
                  Bmicalculation calc =
                      Bmicalculation(height: height, weight: weight);
                  calc.Results();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return ResultPage(
                        PrintText: calc.calculation(),
                        Value: calc.Results(),
                        InterpretationText: calc.Interpretation(),
                      );
                    }),
                  );
                },
                TextValue: 'CALCULATE',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(
        icon,
        color: Colors.white,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      elevation: 10.0,
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
    );
  }
}
