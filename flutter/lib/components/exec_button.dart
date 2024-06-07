import 'package:flutter/material.dart';

class ExecButton extends StatefulWidget {
  const ExecButton({super.key, required this.onPressed, this.isOn = false});

  final bool isOn;
  final Function onPressed;

  @override
  ExecButtonState createState() => ExecButtonState();
}

class ExecButtonState extends State<ExecButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed(),
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
      ),
      child: Icon(Icons.flag, color: widget.isOn ? Colors.green : Colors.grey),
    );
  }
}
