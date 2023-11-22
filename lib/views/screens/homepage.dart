import 'package:adv_flutter_5pm/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CounterProvider>(context);
    var providerFalse = Provider.of<CounterProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              providerFalse.incrementCounter();
            },
            child: (Provider.of<CounterProvider>(context).counter.count == 5)
                ? const Icon(Icons.done_rounded)
                : const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              providerFalse.decrementCounter();
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
