import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class ThemeProvider with ChangeNotifier {
  bool isLightTheme;

  ThemeProvider({this.isLightTheme});

  // use to toggle the theme
  toggleThemeData() async {
    final settings = await Hive.openBox('settings');
    settings.put('isLightTheme', !isLightTheme);
    isLightTheme = !isLightTheme;
    // getCurrentStatusNavigationBarColor();
    notifyListeners();
  }

  // Global theme data we are always check if the light theme is enabled #isLightTheme
  ThemeData themeData(context) {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primarySwatch: isLightTheme ? Colors.grey : Colors.grey,
      primaryColor: isLightTheme ? Colors.white : Color(0xFF1E1F28),
      brightness: isLightTheme ? Brightness.light : Brightness.dark,
      backgroundColor: isLightTheme ? Color(0xFFFFFFFF) : Color(0xFF121212),
      scaffoldBackgroundColor:
      isLightTheme ? Color(0xFFFFFFFF) : Color(0xFF121212),
      textTheme: GoogleFonts.ubuntuTextTheme(Theme.of(context).textTheme),
      textSelectionColor: isLightTheme ? Color(0xFF000000) : Color(0xFFBDBDBD),
      dividerTheme: DividerThemeData(
        space: 8,
        indent: 0,
        endIndent: 0,
        color: isLightTheme ? Color(0xFF757575) : Color(0xFF757575),
      ),
    );
  }

  // Theme mode to display unique properties not cover in theme data
  ThemeColor themeMode() {
    return ThemeColor(
      gradient: [
        if (isLightTheme) ...[Colors.greenAccent, Colors.yellow, Colors.deepOrange[300],
          Colors.lightBlueAccent, Colors.cyan[50], Colors.grey[200], Colors.red[400],
          Colors.blue[300], Colors.orange[300], Colors.purpleAccent, Colors.greenAccent[700]],

        if (!isLightTheme) ...[Color(0xFFF2C9A5), Color(0xFFF69FBB), Color(0xFFB6E8A4),
          Color(0xFF51cfa0), Color(0xFF5e72a3), Color(0xFF323F4B),  Color(0xFFF2C9A5),
          Color(0xFFF69FBB), Color(0xFFB6E8A4), Color(0xFF51cfa0), Color(0xdd9575cd),]
      ],
      textColor: isLightTheme ? Color(0xFF000000) : Color(0xA6A6A6),
      iconColor: isLightTheme ? Color(0xFF000000) : Color(0xFF757575),
      toggleButtonColor: isLightTheme ? Colors.black : Colors.white,
      barColor:
      isLightTheme ? Color(0xFFFFFFFF) : Color(0xFF1C1C1C),
      backgroundColor: isLightTheme ? Colors.white : Color(0xFF1C1C1C),
      shadow: [
        if (isLightTheme)
          BoxShadow(
              color: Color(0xDDd8d7da),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(7, 7)),
        if (!isLightTheme)
          BoxShadow(
              color: Color(0x66000000),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(7, 7))
      ],
    );
  }
}

// A class to manage specify colors and styles in the app not supported by theme data
class ThemeColor {
  List<Color> gradient;
  Color backgroundColor;
  Color toggleButtonColor;
  Color barColor;
  Color textColor;
  Color iconColor;
  List<BoxShadow> shadow;

  ThemeColor({
    this.gradient,
    this.backgroundColor,
    this.barColor,
    this.toggleButtonColor,
    this.textColor,
    this.iconColor,
    this.shadow,
  });
}