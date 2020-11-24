import 'dart:math';
class CalcBrain{
  CalcBrain({this.h,this.w});
 int h;
 int w;

  double _bmi;

  String CalculateBMI(){
    _bmi = w/(pow(h/100,2));
    return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if(_bmi >= 25.0)
      {
        return 'OVERWEIGHT!!!';
      }
    if(_bmi>=18.5)
      {
        return 'NORMAL!';
      }
    if(_bmi<18.5)
      return 'UNDERWEIGHT!!!';

  }
  String getinterpretation()
  {
    if(_bmi>=25.0)
    {
      return 'You have higher than normal body weight. Try to exercise more.';

    }
    if(_bmi>=18.5)
    {
      return 'You have a normal body weight. Good job!';
    }
     if(_bmi<18.5)
      return 'You have lower than normal body weight. You can eat more.';
  }
}