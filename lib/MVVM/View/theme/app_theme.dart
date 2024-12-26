import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.light,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(),
    scaffoldBackgroundColor: Colors.white,
  );

  static const primaryGradient = LinearGradient(
    colors: [
      // Color.fromARGB(250, 190, 72, 254),
      // Color.fromARGB(250, 255, 95, 242),
      Color.fromARGB(249, 254, 253, 255),
      Color.fromARGB(248, 249, 247, 247)
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const secondaryGradient = LinearGradient(
    colors: [
      Color(0xFF6448FE),
      Color.fromARGB(255, 70, 172, 227),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const cardTheme = CardTheme(
    elevation: 4.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
  );
}
