import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

//IOS Light Theme
CupertinoThemeData? iOSLightTheme = CupertinoThemeData(
  brightness: Brightness.light,
  applyThemeToAll: true,
  scaffoldBackgroundColor: kWhiteBackgroundColor,
);

//IOS Dark Theme
CupertinoThemeData? iOSDarkTheme = CupertinoThemeData(
  brightness: Brightness.dark,
  applyThemeToAll: true,
  scaffoldBackgroundColor: kDarkBackgroundColor,
);

//Android Light Theme
ThemeData androidLightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  applyElevationOverlayColor: false,

  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontFamily: "Sk-Modernist",
      fontSize: 36,
      fontWeight: FontWeight.w900,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
    titleMedium: TextStyle(
      fontFamily: "Sk-Modernist",
      fontSize: 20,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
    titleSmall: TextStyle(
      fontFamily: "Sk-Modernist",
      fontSize: 16,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
    bodyLarge: TextStyle(
      fontFamily: "Sk-Modernist",
      fontSize: 24,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
    bodyMedium: TextStyle(
      fontFamily: "Sk-Modernist",
      fontSize: 18,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
    bodySmall: TextStyle(
      fontFamily: "Sk-Modernist",
      fontSize: 12,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
    labelLarge: TextStyle(
      fontFamily: "Sk-Modernist",
      fontSize: 30,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
    labelMedium: TextStyle(
      fontFamily: "Sk-Modernist",
      fontSize: 20,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
    labelSmall: TextStyle(
      fontFamily: "Sk-Modernist",
      fontSize: 10,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
  ),
  // textTheme: GoogleFonts.montserratAlternatesTextTheme(Typography.dense2021),
  colorScheme: ColorScheme.light(
    background: kWhiteBackgroundColor,
    primary: Colors.grey.shade800,
    inversePrimary: kDarkBackgroundColor,
    secondary: Colors.grey.shade700,
    brightness: Brightness.light,
    error: kErrorColor,
  ),
);

//Android Dark Theme
ThemeData androidDarkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontFamily: "Sk-Modernist",
      fontSize: 36,
      fontWeight: FontWeight.w900,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
    titleMedium: TextStyle(
      fontFamily: "Sk-Modernist",
      fontSize: 20,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
    titleSmall: TextStyle(
      fontFamily: "Sk-Modernist",
      fontSize: 16,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
    bodyLarge: TextStyle(
      fontFamily: "Sk-Modernist",
      fontSize: 24,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
    bodyMedium: TextStyle(
      fontFamily: "Sk-Modernist",
      fontSize: 18,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
    bodySmall: TextStyle(
      fontFamily: "Sk-Modernist",
      fontSize: 12,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
    labelLarge: TextStyle(
      fontFamily: "Sk-Modernist",
      fontSize: 30,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
    labelMedium: TextStyle(
      fontFamily: "Sk-Modernist",
      fontSize: 20,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
    labelSmall: TextStyle(
      fontFamily: "Sk-Modernist",
      fontSize: 10,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      letterSpacing: -0.40,
    ),
  ),
  // textTheme: GoogleFonts.montserratAlternatesTextTheme(Typography.dense2021),
  colorScheme: ColorScheme.dark(
    background: kDarkBackgroundColor,
    primary: Colors.grey.shade400,
    inversePrimary: Colors.grey.shade300,
    secondary: Colors.grey.shade200,
    brightness: Brightness.dark,
    error: kErrorColor,
  ),
);
