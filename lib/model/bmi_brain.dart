
import 'dart:math';

import 'package:flutter/cupertino.dart';

class MainBrain{

  MainBrain({@required this.height,@required this.weight});
  final int height;
  final int weight;
  double bmi;

  String calculateBMI(){
    bmi= weight/pow(height/100, 2);
    print(bmi);
    return bmi.toStringAsFixed(1);
  }

  String getWeightType(){
    if(bmi <= 18.5){
      return "Underweight";
    }else if (bmi <= 25.0 && bmi > 18.5){
      return "Normal";
    }else{
      return "Overweight";
    }
  }


  String getAdvice(){
    if(bmi>=51.0){
      return "You have to watch your weight, maybe do some exercises and consult your doctor regularly to avoid health issues.";
    }else if (bmi>18.0){
      return "You are in perfect shape, maintain your weight and eat right.";
    }else{
      return "You aren't taking the right amount and type of food to better your health, increase your food intake and eat healthily to avoid health issues";
    }
  }
}