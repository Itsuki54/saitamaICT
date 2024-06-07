import 'package:flutter/material.dart';

class TerminalButton extends StatefulWidget {
  const TerminalButton({super.key, required this.onPressed, this.isOn = false});

  final bool isOn;
  final Function onPressed;

  @override
  TerminalButtonState createState() => TerminalButtonState();
}

class TerminalButtonState extends State<TerminalButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed(),
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
      ),
      child:
          Icon(Icons.terminal, color: widget.isOn ? Colors.amber : Colors.grey),
    );
  }
}
