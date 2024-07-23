import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// UI Components
import 'package:KUDAMONOCode/components/exec_button.dart';
import 'package:KUDAMONOCode/components/terminal_button.dart';

class EditorAppBar extends StatefulWidget implements PreferredSizeWidget {
  const EditorAppBar({
    super.key,
    required this.isTerminal,
    required this.isExec,
  });

  final Function isTerminal;
  final Function isExec;

  @override
  EditorAppBarState createState() => EditorAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class EditorAppBarState extends State<EditorAppBar> {
  bool isShowedTerminal = false;
  bool isExeced = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text("KDMN Code",
            style: GoogleFonts.anton(
                fontSize: 32, color: Theme.of(context).colorScheme.onPrimary)),
        const Expanded(child: SizedBox()),
        TerminalButton(onPressed: () {
          setState(() {
            isShowedTerminal = !isShowedTerminal;
          });
          widget.isTerminal();
        }),
        const SizedBox(width: 8),
        ExecButton(onPressed: () {
          setState(() {
            isExeced = !isExeced;
          });
          widget.isExec();
        }),
      ]),
      backgroundColor: Colors.black,
    );
  }
}
