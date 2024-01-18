import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_3/widget/expenses.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
   //   .then((func) {
    runApp(const MainApp());
  //},);
}

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.teal);
var kDarkScheme =
    ColorScheme.fromSeed(seedColor: Colors.indigo, brightness: Brightness.dark);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kDarkScheme.primaryContainer,
          foregroundColor: kDarkScheme.onPrimaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kDarkScheme.secondaryContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkScheme.primaryContainer,
            foregroundColor: kDarkScheme.onPrimaryContainer,
          ),
        ),
        iconTheme: IconThemeData(color: kDarkScheme.secondary),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: GoogleFonts.reemKufi(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              headlineSmall: GoogleFonts.eagleLake(color: Colors.white),
              bodyLarge: GoogleFonts.tomorrow(
                fontSize: 18,
                //fontWeight: FontWeight.bold,
              ),
              bodyMedium: GoogleFonts.podkova(
                color: kDarkScheme.onSecondaryContainer,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
      ),
      theme: ThemeData(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primaryContainer,
          foregroundColor: kColorScheme.onPrimaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.tertiaryContainer,
            foregroundColor: kColorScheme.onTertiaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: GoogleFonts.reemKufi(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              bodyLarge: GoogleFonts.tomorrow(
                fontSize: 18,
                //fontWeight: FontWeight.bold,
              ),
              bodyMedium: GoogleFonts.podkova(
                color: kColorScheme.onSecondaryContainer,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
      ),
      themeMode: ThemeMode.system,
      home: const ExpenseTracker(),
    );
  }
}
