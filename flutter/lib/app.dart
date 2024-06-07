import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KUDAMONO Code',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.black, // 主要な色
          secondary: Colors.grey, // セカンダリ色
          surface: Colors.white, // 表面色
          error: Colors.red, // エラー色
          onPrimary: Colors.white, // 主要な色の上でのテキスト色
          onSecondary: Colors.black,
          onSurface: Colors.black,
          onError: Colors.red, // エラー色の上でのテキスト色
          brightness: Brightness.light, // 明るさ
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.dark(
          primary: Colors.grey.shade800, // 主要な色
          secondary: Colors.white, // セカンダリ色
          surface: const Color(0xFF363636), // 表面色
          error: Colors.red, // エラー色
          onPrimary: Colors.white, // 主要な色の上でのテキスト色
          onSecondary: Colors.white,
          onSurface: Colors.white,
          onError: Colors.red, // エラー色の上でのテキスト色
        ),
        useMaterial3: true,
      ),
      home: const TextEditor(),
      //home: const Settings(),
    );
  }
}

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

class EditorAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EditorAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text("filename", style: GoogleFonts.anton(fontSize: 32)),
        const Expanded(child: SizedBox()),
        const Padding(
            padding: EdgeInsets.all(5), child: ExecButton(isOn: false)),
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

class ExecButton extends StatefulWidget {
  const ExecButton({super.key, this.isOn = false});

  final bool isOn;

  @override
  ExecButtonState createState() => ExecButtonState();
}

class ExecButtonState extends State<ExecButton> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 24,
      child: Icon(
        Icons.terminal,
        color: widget.isOn ? Colors.amber : Colors.grey,
        size: 28,
      ),
    );
  }
}
