import 'package:flutter/material.dart';

class TerminalButton extends StatelessWidget {
  const TerminalButton({super.key, required this.onPressed, this.isOn = false});

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
      child: Icon(Icons.terminal, color: isOn ? Colors.amber : Colors.grey),
    );
  }
}
