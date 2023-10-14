import 'dart:io';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:front/pages/cv_login.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows) {
    setWindowMaxSize(const Size(1024, 768));
    setWindowMinSize(const Size(512, 384));
    Future<Null>.delayed(Duration(seconds: 1), () {
      setWindowFrame(
          Rect.fromCenter(center: Offset(1000, 500), width: 600, height: 1000));
    });
  }
  //setWindowMinSize(const Size(200, 200));
  //setWindowMaxSize(const Size(300, 300));
  /*if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    DesktopWindow.setMinWindowSize(const Size(800, 600));
  }*/
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.lightBlue, // Couleur de l'app bar (header)
        ),
        primaryColor: Colors.blue, // Couleur principale de l'application
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto', // Police par défaut
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 16.0,
            color: Colors.blue,
          ), // Style de texte par défaut
          titleLarge: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ), // Style de titre
        ),
      ),
      home: const CvLogin(),
    );
  }
}
