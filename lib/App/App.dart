// import 'package:bmi_calculator/feathers/auth/screens/BMI_Calculator.dart';
import 'package:bmi_calculator/feathers/auth/screens/Save_In_Shared_Preference.dart';
import 'package:bmi_calculator/feathers/auth/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: loginscreen(),
    );
  }
}
