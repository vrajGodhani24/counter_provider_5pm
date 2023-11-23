import 'package:adv_flutter_5pm/model/counter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  getCounter() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    counter.count = sharedPreferences.getInt('counter') ?? 0;

    notifyListeners();
  }
}
