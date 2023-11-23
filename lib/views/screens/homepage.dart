import 'package:adv_flutter_5pm/provider/counter_provider.dart';
import 'package:adv_flutter_5pm/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CounterProvider>(context);
    var providerFalse = Provider.of<CounterProvider>(context, listen: false);
    var themeProvider = Provider.of<ThemeProvider>(context);
    var themeProviderFalse = Provider.of<ThemeProvider>(context, listen: false);

    providerFalse.getCounter();
    themeProviderFalse.getTheme();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
        actions: [
          Switch(
            value: themeProvider.theme.isDark,
            onChanged: (val) async {
              themeProviderFalse.changeTheme();

              SharedPreferences prefs = await SharedPreferences.getInstance();

              await prefs.setBool('isDark', themeProviderFalse.theme.isDark);
            },
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async {
              providerFalse.incrementCounter();

              SharedPreferences prefs = await SharedPreferences.getInstance();

              prefs.setInt('counter', providerFalse.counter.count);
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () async {
              providerFalse.decrementCounter();

              SharedPreferences prefs = await SharedPreferences.getInstance();

              prefs.setInt('counter', providerFalse.counter.count);
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
      body: Center(
        child: Text(
          '${provider.counter.count}',
          style: const TextStyle(fontSize: 80),
        ),
      ),
    );
  }
}
