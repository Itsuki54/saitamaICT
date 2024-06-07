import 'package:flutter/material.dart';
// UI Components
import 'package:KUDAMONOCode/components/editor_appbar.dart';

class TextEditor extends StatefulWidget {
  const TextEditor({super.key});

  @override
  TextEditorState createState() => TextEditorState();
}

class TextEditorState extends State<TextEditor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EditorAppBar(),
        body: Column(
          children: [],
        ));
  }
}
