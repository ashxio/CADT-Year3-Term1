import 'package:flutter/material.dart';
void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SelectableButton(),
          SelectableButton(),
          SelectableButton(),
        ],
      ),
    ),
  ),
);

class SelectableButton extends StatefulWidget {
  const SelectableButton({super.key});

  @override
  State<SelectableButton> createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  bool isSelected = false;
  String get buttonText => isSelected ? "Selected" : "Not Selected";
  Color get textColor => isSelected ? Colors.white : Colors.black;
  Color get backgroundColor =>
      isSelected ? Colors.blue[500]! : Colors.blue[50]!;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        height: 100,
        child: ElevatedButton(
          onPressed: () => setState(() => isSelected = !isSelected),
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
          ),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(color: textColor),
            ),
          ),
        ),
      )
    );
  }
}