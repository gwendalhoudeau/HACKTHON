import 'dart:io';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:front/pages/cv_login.dart';
import 'package:front/utils/c_theme_provider.dart';
import 'package:window_size/window_size.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  debugPrint(dotenv.env['API_URL']);
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows) {
    setWindowMaxSize(const Size(1024, 768));
    setWindowMinSize(const Size(512, 384));
    Future<Null>.delayed(Duration(seconds: 1), () {
      setWindowFrame(
          Rect.fromCenter(center: Offset(1000, 500), width: 600, height: 1000));
    });
  }
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: themeProvider.currentTheme,
          home: CvLogin(),
        );
      },
    );
  }
}




/*ThemeData(
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
        )*/