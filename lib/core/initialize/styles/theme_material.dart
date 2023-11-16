import 'package:capstone_project_travel_ease/core/constrants/color_constants.dart';
import 'package:flutter/material.dart';

class CoreTheme {
  static ThemeData get theme => _themeData;

  static final ThemeData _themeData = ThemeData(
      useMaterial3: true,
      hintColor: kTextColorGrey,
      indicatorColor: Colors.white,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Color(0xffbce96b),
        refreshBackgroundColor: Colors.white,
        linearTrackColor: Colors.white,
        circularTrackColor: Colors.white,
      ),
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: kPrimaryColor,
        onPrimary: Colors.white,
        primaryContainer: Colors.green,
        onPrimaryContainer: Colors.white,
        error: Color(0xffBA1A1A),
        onError: Colors.white,
        errorContainer: Color(0xffFFDAD6),
        onErrorContainer: Color(0xff410002),
        background: Color(0xffF5F5F5),
        onBackground: Color(0xff191C19),
        secondary: Color(0xff4858A9),
        onSecondary: Colors.white,
        secondaryContainer: Color(0xffDEE1FF),
        onSecondaryContainer: Color(0xff00115A),
        surface: Color(0xffFBFDF7),
        onSurface: Color(0xff191C19),
        tertiary: Color(0xff3A646F),
        onTertiary: Colors.white,
        tertiaryContainer: Color(0xffffffff),
        onTertiaryContainer: Color(0xff001F26),
        surfaceVariant: Color(0xffDDE5DB),
        onSurfaceVariant: Color(0xff414941),
        outline: Color(0xff717971),
      ),
      // drawerTheme: const DrawerThemeData(
      //     backgroundColor: Colors.white, surfaceTintColor: Colors.blue),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
      ),
      // scaffoldBackgroundColor: kPrimaryLightColor,
      // colorSchemeSeed: kPrimaryLightColor,
      // bottomSheetTheme: const BottomSheetThemeData(
      //     backgroundColor: Colors.red,
      //     surfaceTintColor: Colors.red,
      // ),
      brightness: Brightness.light,
      applyElevationOverlayColor: true,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        shadowColor: kShadowColor,
        scrolledUnderElevation: 2,
        centerTitle: true,
        color: kPrimaryColor,
        actionsIconTheme: IconThemeData(color: Colors.white, size: 30),
        iconTheme: IconThemeData(color: Colors.white),

        // backgroundColor: const Color(0xff0e86dc),
        titleTextStyle: TextStyle(
          fontFamily: 'Roboto',
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(10),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: Colors.red[300]!),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(18),
        ),
        labelStyle: const TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w700,
          fontSize: 14,
          height: 1.3,
        ),
      ),
      dividerTheme: DividerThemeData(color: Colors.grey[300]),
      cardTheme: CardTheme(
        // clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kDefaultBorderRadius),
            side: BorderSide(color: Colors.grey.shade200)),
        elevation: 0,
      ),
      // fontFamily: 'Roboto',
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          visualDensity: VisualDensity.compact,
          textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              wordSpacing: 0,
              letterSpacing: 0,
              fontSize: 13,
            ),
          ),
        ),
      ),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kDefaultBorderRadius),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,

          // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 32,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 28,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 24,
        ),
        titleLarge: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 22,
        ),
        titleMedium: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 18,
        ),
        titleSmall: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 16,
        ),
        labelLarge: TextStyle(
          fontSize: 16,
        ),
        labelMedium: TextStyle(
          fontSize: 14,
        ),
        labelSmall: TextStyle(
          fontSize: 13,
        ),
        bodyLarge: TextStyle(
          fontFamily: '',
          fontSize: 18,
        ),
        bodyMedium: TextStyle(
          fontFamily: '',
          fontSize: 16,
        ),
        bodySmall: TextStyle(
          fontFamily: '',
          fontSize: 14,
        ),
      ),
      buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.normal,
      ));
}
