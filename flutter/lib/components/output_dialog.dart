import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OutputDialog extends StatelessWidget {
  const OutputDialog({
    super.key,
    required this.std,
    required this.stderr,
  });

  final String std;
  final String stderr;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(children: [
                    const SizedBox(width: 8),
                    Text("Output",
                        style: GoogleFonts.anton(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    const Expanded(child: SizedBox()),
                    const CloseButton(),
                  ]),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(children: [
                                Text(std,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold))
                              ]),
                              const SizedBox(height: 15),
                              Row(children: [
                                Text(stderr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red.shade700))
                              ]),
                            ],
                          ),
                        ),
                      ])),
                ])));
  }
}
