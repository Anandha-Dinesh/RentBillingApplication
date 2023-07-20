import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:rentbillingapp/pages/login_page.dart';
import 'package:rentbillingapp/pages/main_page.dart';
import 'package:rentbillingapp/pages/manageUser.dart';
import 'package:rentbillingapp/pages/new_user.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RentBillingApp',
      theme: ThemeData(
        primarySwatch: Colors.green,
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Colors.blue,
            onPrimary: Color.fromARGB(255, 255, 255, 255),
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
      home: LoginPage(),
      routes: {
        '/home': (context) => const MainPage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/newuser': (context) => const NewUser(),
        '/manageuser': ((context) => const ManageUser())
      },
    );
  }
}
