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

class TextEditorScreen extends StatefulWidget {
  @override
  _TextEditorScreenState createState() => _TextEditorScreenState();
}

class _TextEditorScreenState extends State<TextEditorScreen> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'Enter your text here...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // You can add your save logic here
              print('Text: ${_controller.text}');
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
