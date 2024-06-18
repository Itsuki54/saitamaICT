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
        minimumSize: const Size(24, 24),
        padding: const EdgeInsets.all(12),
      ),
      child: Icon(Icons.flag, color: isOn ? Colors.green : Colors.grey),
    );
  }
}
