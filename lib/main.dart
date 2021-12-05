import 'package:flutter/material.dart';
import 'package:bmicalculator/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF131226),  //it only change the appbar color,toolbar,etc. but not body
        scaffoldBackgroundColor: Color(0xFF131226),//it change the color of body(Colorzilla used)

      ),
      home: InputPage(),
    );
  }
}
