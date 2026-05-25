import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_theme.dart';
import 'home_page.dart';

void main() {
  runApp(const DawahApp());
}

class DawahApp extends StatelessWidget {
  const DawahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peace Can Heal — Discover The Truth',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: C.bg,
        textTheme: GoogleFonts.nunitoTextTheme(ThemeData.light().textTheme),
        colorScheme: const ColorScheme.light(
          primary: C.accent,
          secondary: C.green,
          surface: C.white,
        ),
      ),
      home: const HomePage(),
    );
  }
}
