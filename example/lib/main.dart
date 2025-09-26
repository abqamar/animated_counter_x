import 'package:flutter/material.dart';
import 'package:animated_counter_x/animated_counter_x.dart';

void main() {
  runApp(const CounterExampleApp());
}

class CounterExampleApp extends StatelessWidget {
  const CounterExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimatedCounterX Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CounterExampleScreen(),
    );
  }
}

class CounterExampleScreen extends StatelessWidget {
  const CounterExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedCounterX Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Increment example
            AnimatedCounterX(
              start: 0,
              end: 100,
              duration: const Duration(seconds: 5),
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              prefix: "\$",
              onComplete: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Increment complete!')),
                );
              },
            ),
            const SizedBox(height: 50),

            // Decrement example
            AnimatedCounterX(
              start: 100,
              end: 1,
              duration: const Duration(seconds: 4),
              style: const TextStyle(fontSize: 40, color: Colors.red),
              suffix: "%",
              onComplete: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Decrement complete!')),
                );
              },
            ),

            const SizedBox(height: 50),

            // Double with prefix and suffix
            AnimatedCounterX(
              start: 0.0,
              end: 99.99,
              duration: const Duration(seconds: 6),
              decimalPlaces: 2,
              style: const TextStyle(fontSize: 35, color: Colors.green),
              prefix: "Score: ",
              suffix: " pts",
              onComplete: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Double counter done!')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
