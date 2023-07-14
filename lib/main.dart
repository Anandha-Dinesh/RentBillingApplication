import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './pages/main_page.dart';
//import './pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RentBillingApp',
      theme: ThemeData(
        primarySwatch: Colors.green,
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Colors.blue,
            onPrimary: Colors.lightBlue,
            secondary: Colors.amber,
            onSecondary: Colors.amber,
            error: Colors.red,
            onError: Color.fromARGB(255, 238, 54, 54),
            background: Color.fromARGB(255, 0, 0, 0),
            onBackground: Colors.white,
            surface: Colors.yellow,
            onSurface: Colors.teal),
        fontFamily: GoogleFonts.asul().fontFamily,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 54,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          bodySmall: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
          titleLarge: TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.w800,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        // buttonTheme: ButtonThemeData(disabledColor: Colors.grey,textTheme: )
      ),
      home: const MainPage(),
    );
  }
}
