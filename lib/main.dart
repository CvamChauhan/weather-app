import 'package:flutter/material.dart';
import 'package:weather/screens/loading_screen.dart';

void main() {
  runApp(
    const MaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    ),
  );
}
