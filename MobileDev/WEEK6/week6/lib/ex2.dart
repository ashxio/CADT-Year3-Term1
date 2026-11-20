
import 'package:flutter/material.dart';
enum ButtonType { 
  primary(Colors.blue), 
  secondary(Colors.green), 
  disabled(Colors.grey);
  final Color color;
  const ButtonType(this.color);
  }
enum IconPosition { left, right }

class Exercise2 extends StatelessWidget {
  const Exercise2({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Custom buttons')),
        body: const Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              CustomButton(label: 'Submit', icon: Icons.check),
              SizedBox(height: 12),
              CustomButton(
                label: 'Time',
                icon: Icons.access_time,
                iconPosition: IconPosition.right,
                type: ButtonType.secondary,
              ),
              SizedBox(height: 12),
              CustomButton(
                label: 'Account',
                icon: Icons.account_tree,
                iconPosition: IconPosition.right,
                type: ButtonType.disabled,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType type;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.type = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    final children = iconPosition == IconPosition.left
        ? [Icon(icon), const SizedBox(width: 8), Text(label)]
        : [Text(label), const SizedBox(width: 8), Icon(icon)];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: ShapeDecoration(
        color: type.color,
        shape: const StadiumBorder(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
        ),
    );
  }
}