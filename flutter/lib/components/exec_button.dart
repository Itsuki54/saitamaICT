import 'package:flutter/material.dart';

class ExecButton extends StatelessWidget {
  const ExecButton({super.key, required this.onPressed, this.isOn = false});

  final bool isOn;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
      ),
      child: Icon(Icons.flag, color: isOn ? Colors.green : Colors.grey),
    );
  }
}
