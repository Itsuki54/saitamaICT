import 'package:flutter/material.dart';
// Pages
import 'package:KUDAMONOCode/pages/editor.dart';
import 'package:KUDAMONOCode/pages/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KUDAMONO Code',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashColor: Colors.white,
        colorScheme: ColorScheme.light(
          primary: Colors.black, // 主要な色
          secondary: Colors.grey, // セカンダリ色
          surface: Colors.grey.shade900, // 表面色
          error: Colors.red, // エラー色
          onPrimary: Colors.white, // 主要な色の上でのテキスト色
          onSecondary: Colors.black,
          onSurface: Colors.black,
          onError: Colors.red, // エラー色の上でのテキスト色
          brightness: Brightness.light, // 明るさ
        ),
        useMaterial3: true,
      ),
      //home: const TextEditor(),
      home: const Home(),
      //home: const Settings(),
    );
  }
}
