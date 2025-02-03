import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier {
  // Default theme values (initially for Vendor 1)
  Color primaryColor = Colors.blue;
  Color secondaryColor = Colors.green;
  Color backgroundColor = Colors.white;
  Color textColor = Colors.black;
  Color buttonColor = Colors.blue;
  Color appBarColor = Colors.blue;
  Color iconColor = Colors.white;
  Color bottomNavBarColor = Colors.white; // Added bottom nav bar color
  Color bottomNavBarIconColor = Colors.white; // Added bottom nav bar icon color

  // Method to set theme based on vendor
  void setVendorTheme(String vendor) {
    switch (vendor) {
      case "Vendor1":
        _setVendor1Theme();
        break;
      case "Vendor2":
        _setVendor2Theme();
        break;
      case "Vendor3":
        _setVendor3Theme();
        break;
      default:
        _setVendor1Theme(); // Fallback to Vendor 1 theme
        break;
    }
    notifyListeners();
  }

  // Vendor 1 theme setup
  void _setVendor1Theme() {
    primaryColor = Colors.blue;
    secondaryColor = Colors.green;
    backgroundColor = Colors.white;
    textColor = Colors.black;
    buttonColor = Colors.blue;
    appBarColor = Colors.blue;
    iconColor = Colors.white;
    bottomNavBarColor = Colors.blue;
    bottomNavBarIconColor = Colors.white;
  }

  // Vendor 2 theme setup
  void _setVendor2Theme() {
    primaryColor = Colors.red;
    secondaryColor = Colors.orange;
    backgroundColor = Colors.white;
    textColor = Colors.black;
    buttonColor = Colors.red;
    appBarColor = Colors.red;
    iconColor = Colors.white;
    bottomNavBarColor = Colors.red;
    bottomNavBarIconColor = Colors.white;
  }

  // Vendor 3 theme setup
  void _setVendor3Theme() {
    primaryColor = Colors.purple;
    secondaryColor = Colors.pink;
    backgroundColor = Colors.white;
    textColor = Colors.black;
    buttonColor = Colors.purple;
    appBarColor = Colors.purple;
    iconColor = Colors.white;
    bottomNavBarColor = Colors.purple;
    bottomNavBarIconColor = Colors.white;
  }

  // Creating a dynamic ThemeData
  ThemeData get themeData {
    return ThemeData(
      primaryColor: primaryColor,
      secondaryHeaderColor: secondaryColor,
      appBarTheme: AppBarTheme(
        color: appBarColor,
        iconTheme: IconThemeData(color: iconColor),
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: textColor),
        bodyMedium: TextStyle(color: textColor),
        titleLarge: TextStyle(color: textColor, fontWeight: FontWeight.bold),
      ),
      scaffoldBackgroundColor: backgroundColor,
      buttonTheme: ButtonThemeData(buttonColor: buttonColor),
      colorScheme: getColorScheme(),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor:
            backgroundColor, // Background color for Bottom Navigation Bar
        selectedItemColor: primaryColor, // Ensure this is correctly assigned
        unselectedItemColor: Colors.grey, // Unselected icon color
        elevation: 10, // Optional: Adds a shadow effect
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: primaryColor, // Button text color (white)
        ),
      ),
    );
  }

  ColorScheme getColorScheme() {
    return ColorScheme(
      primary: primaryColor, // Primary color (used for buttons, app bar, etc.)
      secondary:
          secondaryColor, // Secondary color (used for floating action buttons, etc.)
      surface:
          backgroundColor, // Background color for most of the app's surfaces
      error: Colors.red, // Error color
      onPrimary: Colors.white, // Text/icons on primary color
      onSecondary: Colors.white, // Text/icons on secondary color
      onSurface: textColor, // Text/icons on background
      onError: Colors.white, // Text/icons on error state
      brightness: Brightness.light, // Light or dark mode
    );
  }
}
