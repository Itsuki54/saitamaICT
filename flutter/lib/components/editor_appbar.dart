import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// UI Components
import 'package:KUDAMONOCode/components/exec_button.dart';
import 'package:KUDAMONOCode/components/terminal_button.dart';

class EditorAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EditorAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text("filename", style: GoogleFonts.anton(fontSize: 32)),
        const Expanded(child: SizedBox()),
        TerminalButton(onPressed: () {}, isOn: true),
        ExecButton(isOn: true, onPressed: () {}),
      ]),
      leading: BackButton(
        onPressed: () => Navigator.of(context).pop(),
      ),
      backgroundColor: Colors.black,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(63);
}
