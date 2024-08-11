import 'package:flutter/material.dart';
import 'package:timer_app/src/features/stopwatch/presentation/stopwatch_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 19, 69, 111),
          ),
        ),
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 19, 69, 111),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const StopwatchScreen(),
    );
  }
}
