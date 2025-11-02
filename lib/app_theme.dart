import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AppTheme{
  static const Color primaryColor = Colors.white;
  // static const Color primaryColor = Color(0xFF1C1C1E);
  // static const Color secondaryColor = Color(0xFF1E1E1E);
  static const Color secondaryColor = Color(0xFF2C2C2E);
  // static const Color accentColor = Color(0xFF00B894);
  // static const Color accentColor = Color(0xFF0A84FF);
  static const Color accentColor = Color(0xFF5159F6);
  static const Color backgroundColor = Colors.black;
  static const Color cardColor = Color(0xFF1E1E1E);
  static const Color textPrimaryColor = Colors.black;
  // static const Color textSecondaryColor = Color(0xFFB0B0B0);
  static const Color textSecondaryColor = Color(0xFF8E8E93);
  // static const Color borderColor = Color(0xFF2C2C2C);
  static const Color borderColor = Color(0xFF48484A);
  // static const Color errorColor = Color(0xFFE17055);
  static const Color errorColor = Color(0xFFFF453A);
  // static const Color successColor = Color(0xFF00B894);
  static const Color successColor = Color(0xFF67D292);

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: primaryColor,
    colorScheme: const
    ColorScheme.dark(
        primary: primaryColor,
        // onPrimary: Colors.white,
      onPrimary: textPrimaryColor,
      secondary: secondaryColor,
      //   onSecondary: Colors.white,
      onSecondary: textPrimaryColor,
      error: errorColor,
        surface: secondaryColor,
        // onSurface: Colors.white,
      onSurface: textPrimaryColor,
      onSurfaceVariant: accentColor,
    ),
    textTheme: GoogleFonts.poppinsTextTheme().apply(//apply section is new
      bodyColor: textPrimaryColor,
      displayColor: textPrimaryColor,
    ).copyWith(
      headlineLarge: GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: textPrimaryColor,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: textPrimaryColor,
      ),
      headlineSmall: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: textPrimaryColor,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: textPrimaryColor,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: textPrimaryColor,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: textPrimaryColor,
      ),
    ),
    appBarTheme: AppBarTheme(
      // backgroundColor: Colors.transparent,
      backgroundColor: primaryColor.withOpacity(0.9), // Slightly opaque for scroll depth
      elevation: 0.0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: textPrimaryColor,
      ),
      // Action icons (like New Chat) should use the accent color (Blue)
      iconTheme: const IconThemeData(color: accentColor),
    ),
    //   TextStyle(
    //     fontSize: 18,
    //     fontWeight: FontWeight.w600,
    //     color: textPrimaryColor,
    //   ),
    //   iconTheme: IconThemeData(color: AppTheme.textPrimaryColor),
    // ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: accentColor,
        // foregroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        // padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    cardTheme: CardThemeData(
      color:  cardColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        // side: BorderSide(color:  borderColor, width: 1),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: secondaryColor,
      hintStyle: TextStyle(color: textSecondaryColor),//new
      // contentPadding: const EdgeInsets.symmetric(//new
      //   vertical: 14,//new
      //   horizontal: 16,//new
      // ),//new
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          // color: Colors.white,
          color: accentColor,
          width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color:  borderColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: errorColor),
      ),
      errorStyle: TextStyle(
        color: Colors.redAccent,
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
      floatingLabelStyle: MaterialStateTextStyle.resolveWith((states) {
        if (states.contains(MaterialState.error)) {
          return TextStyle(color: AppTheme.errorColor, fontWeight: FontWeight.w600);
        }
        if (states.contains(MaterialState.focused)) {
          return const TextStyle(color: Colors.white, fontWeight: FontWeight.w600);
        }
        return const TextStyle(color: AppTheme.textSecondaryColor);
      }),
      contentPadding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
    ),
    // floatingActionButtonTheme: FloatingActionButtonThemeData(
    //   backgroundColor: primaryColor,
    //   foregroundColor: Colors.white,
    //   elevation: 0,
    // )
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: accentColor,
      foregroundColor: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    ),

    // used for dividing lists
    dividerColor: borderColor,
    dividerTheme: const DividerThemeData(
      color: borderColor,
      thickness: 0.8,
      space: 1,
      indent: 16,
      endIndent: 16,
    ),
  );
}