import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int value = 0;

  void increment() {
    this.value++;
    notifyListeners();
  }
}
