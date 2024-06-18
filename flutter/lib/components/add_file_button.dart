import 'package:flutter/material.dart';

class AddFileButton extends StatelessWidget {
  const AddFileButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      onPressed: onPressed,
      child: const Icon(Icons.add_rounded, size: 38),
    );
  }
}
