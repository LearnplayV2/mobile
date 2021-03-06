import 'package:flutter/foundation.dart';
import 'package:universal_io/io.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String title = "LearnPlay";

ThemeData theme() {
  _defaultTextStyle() => GoogleFonts.openSans(color: MainTheme.white);

  return ThemeData(
    useMaterial3: true,
    iconTheme: IconThemeData(color: MainTheme.white),
    primaryColor: MainTheme.secondary,
    scaffoldBackgroundColor: MainTheme.primary,
    textTheme: TextTheme(
      headline1: _defaultTextStyle(),
      headline2: _defaultTextStyle(),
      bodyText2: _defaultTextStyle(),
      subtitle1: _defaultTextStyle(),
      bodyText1: _defaultTextStyle(),
      button: _defaultTextStyle(),
    ),
    appBarTheme: AppBarTheme(toolbarHeight: 85, elevation: 0),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(MainTheme.accent),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
            // splashFactory: NoSplash.splashFactory,
            elevation: MaterialStateProperty.all(0)
        )),
  );
}

class MainTheme {
  static final Color primary = Color.fromRGBO(18, 18, 20, 1);
  static final Color secondary = Color.fromRGBO(32, 31, 36, 1);
  static final Color accent = Color.fromRGBO(22, 163, 74, 1);
  static final Color white = Color.fromARGB(255, 184, 184, 184);
  static final Color light = Color.fromRGBO(39, 39, 42, 1);
  static final Color lighter = Color.fromARGB(255, 49, 49, 53);
  static final Color linkPrimary = Color.fromARGB(255, 96, 155, 180);

  static Text normalText(String text) {
    return Text(text, style: TextStyle(color: Colors.white70));
  }

  static Text h1(String text, {Color? color, double? size}) {
    return Text(text,
        style: TextStyle(
            fontSize: size ?? 24,
            fontWeight: FontWeight.bold,
            color: color ?? Colors.white70));
  }
}

class Display {
  static bool isWeb() {
    return kIsWeb;
  }
  
  static bool isDesktop() {
    return (Platform.isWindows || Platform.isLinux || Platform.isMacOS);
  }

  static bool isCellphone() {
    return (Platform.isAndroid || Platform.isIOS);
  }
}
