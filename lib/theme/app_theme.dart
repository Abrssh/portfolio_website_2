import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.light,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(),
    scaffoldBackgroundColor: Colors.white,
  );

  static const primaryGradient = LinearGradient(
    colors: [Color(0xFF6448FE), Color(0xFF5FC6FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
