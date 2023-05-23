import 'package:flutter/material.dart';
import 'package:zhiyin_flutter/pages/common/debug_main_page.dart';
import 'package:zhiyin_flutter/routes/Routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '只因',
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          primary: Colors.black,
        ),
        useMaterial3: true,
      ),
      onGenerateRoute: onGenerateRoute,
      home: const DebugMainPage(),
    );
  }
}
