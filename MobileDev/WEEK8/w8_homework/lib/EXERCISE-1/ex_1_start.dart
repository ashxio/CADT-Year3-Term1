
import 'package:flutter/material.dart';

List<String> colors = ["red", "blue", "green"];

// Method 3: Dedicated Function
List<Widget> getColorLabels() {
  return colors.map((color) => Label(color)).toList();
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Label("Method 1: Loop in Array", bold: true),

              // Method 1: Direct for loop
              for (var color in colors) Label(color),

              Label("Method 2: Map", bold: true),

              // Method 2: map()
              ...colors.map((color) => Label(color)),

              Label("Method 3: Dedicated Function", bold: true),

              // Method 3: Dedicated function
              ...getColorLabels(),
            ],
          ),
        ),
      ),
    ),
  );
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: (bold ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}
