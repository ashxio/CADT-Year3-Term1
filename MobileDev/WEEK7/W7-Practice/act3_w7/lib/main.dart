import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'My app',
      home: Counter(),
    ),
  );
}

class Counter extends StatefulWidget {
  const Counter({
    super.key,
  });

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;
  void onPress() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print("Counter widget - rebuilding...");

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Title("Great counter"),
        Label("Current value: $counter"),
        TextButton(
          onPressed: onPress,
          child: const Text("Increment"),
        )
      ],
    );
  }
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print("Label widget - rebuilding...");

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 30, color: Colors.grey, decoration: TextDecoration.none),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print("const Title widget - rebuilding...");

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 50, color: Colors.blue, decoration: TextDecoration.none),
      ),
    );
  }
}
