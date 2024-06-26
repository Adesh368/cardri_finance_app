import 'package:cardri_finance/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData().copyWith(
      cardTheme: const CardTheme().copyWith(
        //color: kColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(vertical: 4),
      ),
      textTheme: GoogleFonts.soraTextTheme(),
    ),
    home: const SplashScreen(),
  ));
}
