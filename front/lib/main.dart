import 'package:flutter/material.dart';
import 'package:front/pages/cv_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue, // Couleur principale de l'application
        fontFamily: 'Roboto', // Police par défaut
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16.0), // Style de texte par défaut
          titleLarge: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold), // Style de titre
        ),
      ),
      home: const CvHome(),
    );
  }
}
