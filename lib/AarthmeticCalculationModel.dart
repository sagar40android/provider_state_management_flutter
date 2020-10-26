

import 'package:flutter/cupertino.dart';

class AarthmeticCalculationModel extends ChangeNotifier{

  int number=0;
  void incrementCount(){
    number++;
    notifyListeners();
  }

  void decrement(){
    if (number >0){
      number--;
      notifyListeners();
    }
}}