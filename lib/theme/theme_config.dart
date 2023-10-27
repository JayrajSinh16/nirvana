import 'package:flutter/material.dart';
import 'package:nirvana/theme/pallete.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
      ),
      useMaterial3: true, 
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Pallete.darkblue1,
        selectionColor: Pallete.dark_blue1,
        selectionHandleColor: Pallete.dark_blue3,
      ),
      primaryColor: Pallete.mainFontColor,
      cardColor: Pallete.dark_blue1,
      canvasColor: Pallete.darkblue2,
      secondaryHeaderColor: Pallete.lightblue2,
      snackBarTheme: const SnackBarThemeData(
          backgroundColor: Color.fromARGB(178, 42, 147, 213),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
              ),
          ),
      ),
      fontFamily: 'Cera Pro',
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light()
);

ThemeData darkTheme = ThemeData(  
      appBarTheme:const AppBarTheme(
        backgroundColor:  Color.fromARGB(51, 40, 58, 1),
      ),
      useMaterial3: true,
      cardColor: Pallete.dark_blue4,
      canvasColor: Pallete.darkblue4,
      secondaryHeaderColor: Pallete.dark_blue3,
      primaryColor: Colors.white,
      fontFamily: 'Cera Pro',
      snackBarTheme: const SnackBarThemeData(
          backgroundColor: Color.fromARGB(177, 26, 90, 129),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
              ),
          ),
      ),
      scaffoldBackgroundColor: const Color.fromARGB(51, 40, 58, 1),
      colorScheme: const ColorScheme.dark(),
);
