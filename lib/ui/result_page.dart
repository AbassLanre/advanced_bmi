import 'package:advanced_bmi/ui/constants.dart';
import 'package:advanced_bmi/ui/reuseable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.BMIValue, @required this.weightType,  @required this.advice});
  final String weightType;
  final String BMIValue;
  final String advice;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("BMI Result"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Center(
                child: Text(
              "Result",
              style: kBoldStyle,
            )),
          ),
          Expanded(
            flex: 6,
            child: ReuseableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    weightType,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF0A0E21),
                    ),
                  ),
                  SizedBox(height: 50.0,),
                  Text(
                    BMIValue,
                    style: kBoldStyle,
                  ),
                  SizedBox(height: 42.0,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(advice, style: kTitleStyle,),
                  ),
                ],
              ),
            ),
          ),
          //onTap button
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(8.0),
                  shape: BoxShape.rectangle),
              width: double.infinity,
              height: 50.0,
              child:Center(
                child: Text("Re-Calculate",style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
