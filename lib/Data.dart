import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Counter extends ChangeNotifier{
  int counter=0;
  void incrementCount(){
    counter++;
    notifyListeners();
  }

  void decrement(){
    if (counter >0){
      counter--;
      notifyListeners();
    }

  }
}