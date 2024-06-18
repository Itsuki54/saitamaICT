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
            builder: (builder) => Dialog(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Row(children: [CloseButton()]),
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
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red))
                                      ]),
                                    ],
                                  ),
                                ),
                              ])),
                        ]))),
          );
        },
        isExec: () {},
      ),
      //body: Scaffold()
      body: CodeEditor(),
    );
  }
}
