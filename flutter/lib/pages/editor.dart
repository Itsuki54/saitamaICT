import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:highlight/languages/java.dart';
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
      body: CodeEditor(),
      // body: Column(
      //   children: [],
      // ),
    );
  }
}

class CodeEditor extends StatelessWidget {
  CodeEditor({super.key});

  final controller = CodeController(
    text: '...', // Initial code
    language: java,
  );

  @override
  Widget build(BuildContext context) {
    return CodeTheme(
      data: CodeThemeData(styles: monokaiSublimeTheme),
      child: SingleChildScrollView(
        child: CodeField(
          controller: controller,
        ),
      ),
    );
  }
}
