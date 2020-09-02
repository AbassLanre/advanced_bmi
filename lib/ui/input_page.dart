import 'package:advanced_bmi/model/bmi_brain.dart';
import 'package:advanced_bmi/ui/result_page.dart';
import 'package:advanced_bmi/ui/reuseable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'reuseable_floating_action_button.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender tappedGender;
  int height = 160;
  int weight = 50;
  int age = 24;

  Widget firstRow(String gender, IconData genderIcon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genderIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          gender,
          style: kTitleStyle,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("BMI"),
            centerTitle: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //firstRow
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          print("Male");
                          setState(() {
                            tappedGender = Gender.male;
                          });
                        },
                        child: ReuseableCard(
                          cardChild: firstRow("Male", FontAwesomeIcons.mars),
                          colour: tappedGender == Gender.male
                              ? kActiveCardColor
                              : kInactiveCardColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          print("Female");
                          setState(() {
                            tappedGender = Gender.female;
                          });
                        },
                        child: ReuseableCard(
                          cardChild: firstRow("Female", FontAwesomeIcons.venus),
                          colour: tappedGender == Gender.female
                              ? kActiveCardColor
                              : kInactiveCardColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //slider
              Expanded(
                child: ReuseableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Height",
                        style: kTitleStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: kBoldStyle,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "cm",
                            style: kTitleStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          overlayColor: Color(0x29EB1555),
                          thumbColor: Color(0xFFEB1555),
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Colors.grey,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 100,
                          max: 300,
                          onChanged: (double changingValue) {
                            setState(() {
                              print(height);
                              height = changingValue.round();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //lastRow
              Expanded(
                child: Row(
                  children: <Widget>[
                    //weight
                    Expanded(
                      child: ReuseableCard(
                        colour: kActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Weight",
                              style: kTitleStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kBoldStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundFloatingActionButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight += 1;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 7.0,
                                ),
                                RoundFloatingActionButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      weight -= 1;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

                    //Age
                    Expanded(
                      child: ReuseableCard(
                        colour: kActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Age",
                              style: kTitleStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kBoldStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundFloatingActionButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age += 1;
                                    });
                                  },
                                ),
                                SizedBox(width: 7.0),
                                RoundFloatingActionButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age -= 1;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  MainBrain calc = MainBrain(weight: weight, height: height);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ResultPage(
                      BMIValue: calc.calculateBMI(),
                      weightType: calc.getWeightType(),
                      advice: calc.getAdvice(),

                    );
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(8.0),
                      shape: BoxShape.rectangle),
                  width: double.infinity,
                  height: 50.0,
                  child: Center(
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
