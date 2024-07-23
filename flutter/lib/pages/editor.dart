import 'package:KUDAMONOCode/components/output_dialog.dart';
import 'package:flutter/material.dart';
// UI Components
import 'package:KUDAMONOCode/components/code_editor.dart';
import 'package:KUDAMONOCode/components/editor_appbar.dart';

class TextEditor extends StatefulWidget {
  const TextEditor({super.key});

  @override
  TextEditorState createState() => TextEditorState();
}

class TextEditorState extends State<TextEditor> {
  bool isShowedTerminal = false;
  String std = "This is Standard Output";
  String stderr = "This is Standard Error";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: EditorAppBar(
        isTerminal: () {
          showDialog(
              context: context,
              builder: (builder) => OutputDialog(std: std, stderr: stderr));
        },
        isExec: () {},
      ),
      //body: Scaffold()
      body: CodeEditor(),
    );
  }
}
