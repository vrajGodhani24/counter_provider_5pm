import 'package:adv_flutter_5pm/provider/counter_provider.dart';
import 'package:adv_flutter_5pm/provider/theme_provider.dart';
import 'package:adv_flutter_5pm/views/screens/homepage.dart';
import 'package:adv_flutter_5pm/views/screens/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  bool? res = sharedPreferences.getBool('isDone');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => CounterProvider()),
      ],
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: Provider.of<ThemeProvider>(context).theme.isDark
            ? ThemeMode.dark
            : ThemeMode.light,
        initialRoute: (res == null || res == false) ? 'intro' : '/',
        routes: {
          '/': (context) => const HomePage(),
          'intro': (context) => const Intro(),
        },
      ),
    ),
  );
}
