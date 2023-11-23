import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () async {
            SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();

            await sharedPreferences.setBool('isDone', true);

            Navigator.of(context).pushReplacementNamed('/');
          },
          child: const Text("Next"),
        ),
      ),
    );
  }
}
