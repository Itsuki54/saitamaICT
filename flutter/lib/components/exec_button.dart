import 'package:flutter/material.dart';

class ExecButton extends StatelessWidget {
  const ExecButton({super.key, required this.onPressed});

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
      child: const Icon(Icons.flag, color: Colors.green),
    );
  }
}
