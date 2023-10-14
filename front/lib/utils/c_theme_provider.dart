import 'package:flutter/material.dart';

// Fonction pour appliquer un filtre de couleur (daltonisme rouge-vert)

class ThemeProvider extends ChangeNotifier {
  bool daltonismsetted = false;
  ThemeData _currentTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      color: Colors.blue, // Couleur de l'app bar (header)
    ),
    primaryColor: Colors.blue, // Couleur principale de l'application
    secondaryHeaderColor: Colors.black,
    scaffoldBackgroundColor: Colors.white, // Couleur de fond
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 16.0,
        color: Colors.blue,
      ), // Style de texte par défaut
      bodySmall: TextStyle(
        fontSize: 15,
        color: Colors.black,
      ),
      displaySmall: TextStyle(color: Colors.black),
      titleLarge: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ), // Style de titre
    ),
  );

  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    _currentTheme = _currentTheme ==
            ThemeData.light().copyWith(
              appBarTheme: const AppBarTheme(
                color: Colors.blue, // Couleur de l'app bar (header)
              ),
              primaryColor: Colors.blue, // Couleur principale de l'application
              secondaryHeaderColor: Colors.black,
              scaffoldBackgroundColor: Colors.white, // Couleur de fond
              textTheme: const TextTheme(
                bodyLarge: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blue,
                ), // Style de texte par défaut
                bodySmall: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
                displaySmall: TextStyle(color: Colors.black),
                titleLarge: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ), // Style de titre
              ),
            )
        ? ThemeData.dark().copyWith(
            appBarTheme: const AppBarTheme(
              color: Colors.blue, // Couleur de l'app bar (header)
            ),
            primaryColor: Colors.blue, // Couleur principale de l'application
            scaffoldBackgroundColor: Colors.black, // Couleur de fond
            textTheme: const TextTheme(
              bodyLarge: TextStyle(
                fontSize: 16.0,
                color: Colors.blue,
              ), // Style de texte par défaut
              bodySmall: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
              titleLarge: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ), // Style de titre
            ),
          )
        : ThemeData.light().copyWith(
            appBarTheme: const AppBarTheme(
              color: Colors.blue, // Couleur de l'app bar (header)
            ),
            primaryColor: Colors.blue, // Couleur principale de l'application
            secondaryHeaderColor: Colors.black,
            scaffoldBackgroundColor: Colors.white, // Couleur de fond
            textTheme: const TextTheme(
              bodyLarge: TextStyle(
                fontSize: 16.0,
                color: Colors.blue,
              ), // Style de texte par défaut
              bodySmall: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
              displaySmall: TextStyle(color: Colors.black),
              titleLarge: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ), // Style de titre
            ),
          );
    notifyListeners();
  }

  void daltonism() {
    _currentTheme = (daltonismsetted == false)
        ? _currentTheme.copyWith(
            appBarTheme: const AppBarTheme(
              color: Color(0xFF5C87A9), // Couleur de l'app bar (header)
            ),
            primaryColor:
                Color(0xFF5C87A9), // Couleur principale de l'application
            textTheme: const TextTheme(
              bodyLarge: TextStyle(
                fontSize: 16.0,
                color: Color(0xFF5C87A9),
              ), // Style de texte par défaut// Style de titre
            ),
          )
        : _currentTheme.copyWith(
            appBarTheme: const AppBarTheme(
              color: Colors.blue, // Couleur de l'app bar (header)
            ),
            primaryColor: Colors.blue, // Couleur principale de l'application
            textTheme: const TextTheme(
              bodyLarge: TextStyle(
                fontSize: 16.0,
                color: Colors.blue,
              ), // Style de texte par défaut// Style de titre
            ),
          );
    daltonismsetted = !daltonismsetted;
    notifyListeners();
  }

  /*void setDaltonismMode(bool enabled) {
    if (enabled) {
      _currentTheme = ThemeData.from(_currentTheme.copyWith(
        colorFilter: redGreenColorFilter(), // Applique le filtre daltonien
      ));
    } else {
      _currentTheme = ThemeData.from(_currentTheme.copyWith(
        colorFilter: null, // Supprime le filtre daltonien
      ));
    }
    notifyListeners();
  }*/

  void setCustomBackgroundColor(Color color) {
    notifyListeners();
  }
}
