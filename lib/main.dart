import 'package:flutter/material.dart';
import './ui/Home.dart';
void main(){
  runApp(new MaterialApp(
    title: "BMI Finder App",
    home: new Home(),
  ));
}


//underweight =< 18.5
//normal =18.5-24.9
//overweight =25-29.9
//obesity =bmi of 30+
//
//bmi=kg/m*m