import 'package:adv_flutter_5pm/model/counter.dart';
import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  Counter counter = Counter(count: 0);

  void incrementCounter() {
    counter.count++;
    notifyListeners();
  }

  void decrementCounter() {
    counter.count--;
    notifyListeners();
  }
}
