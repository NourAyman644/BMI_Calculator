import 'dart:math';

class BmiLogic {
  final int height;
  final int weight;
   double _bmi=0;

  BmiLogic({required this.height, required this.weight});



  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }


  String getResult() {
    if (_bmi < 18.5) {
      return 'Underweight\n';
    } else if (_bmi >=18.5&&_bmi<=24.9) {
      return 'Normal weight\n';
    } else if(_bmi >=25&&_bmi<=29.9) {
      return 'overweight\n';
    } else if (_bmi >= 30&&_bmi<=34.5) {
      return 'obesity class |\n';
    } else if (_bmi >= 35 && _bmi<=39.9) {
      return 'obesity class ||\n';
    } else {
      return 'obesity class |||\n ';
    }
  }



}