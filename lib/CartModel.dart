

import 'package:flutter/cupertino.dart';

class CartModel extends ChangeNotifier{
  final List<String> _items = [];

  List<String> get allItem => _items;

  int get itemListLength => _items.length;

  void add(String item){
    _items.add(item);
    notifyListeners();
  }

  void removeAll(){
    _items.clear();
    notifyListeners();
  }

}