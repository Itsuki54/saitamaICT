import 'package:flutter/material.dart';

class DirectoryButton extends StatelessWidget {
  const DirectoryButton(
      {super.key,
      required this.onPressed,
      required this.onLeaderPressed,
      required this.fileName});

  final VoidCallback onPressed;
  final VoidCallback onLeaderPressed;
  final String fileName;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        )),
        child: SizedBox(
          width: 110,
          height: 140,
          child: Stack(
            children: [
              Align(
                  alignment: const Alignment(0.0, 0.8),
                  child: Text(fileName,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.bold))),
              Align(
                  alignment: const Alignment(1.8, -1.0),
                  child: IconButton(
                      onPressed: onLeaderPressed,
                      icon: Icon(
                        Icons.more_horiz,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ))),
              Align(
                  alignment: const Alignment(0.0, 0.0),
                  child: Icon(
                    size: 48,
                    Icons.folder_outlined,
                    color: Colors.red.shade700,
                  ))
            ],
          ),
        ));
  }
}
