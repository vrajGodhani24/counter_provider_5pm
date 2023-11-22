import 'package:adv_flutter_5pm/provider/counter_provider.dart';
import 'package:adv_flutter_5pm/views/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        routes: {
          '/': (context) => const HomePage(),
        },
      ),
    ),
  );
}
