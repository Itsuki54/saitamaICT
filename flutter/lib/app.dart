import 'package:flutter/material.dart';
// Pages
import 'package:KUDAMONOCode/pages/editor.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KUDAMONO Code',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashColor: Colors.white,
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
