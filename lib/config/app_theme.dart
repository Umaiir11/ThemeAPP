import 'package:flutter/material.dart';

class AppTheme {
  static const _primaryColor = Colors.blue;
  static const _secondaryColor = Colors.orange;
  static const _borderRadius = 12.0;
  static const _buttonPadding = EdgeInsets.symmetric(vertical: 12, horizontal: 20);

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: _primaryColor,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(primary: _primaryColor, secondary: _secondaryColor),
    appBarTheme: _appBarTheme(_primaryColor, Colors.white),
    textTheme: _lightTextTheme,
    elevatedButtonTheme: _elevatedButtonTheme(Brightness.light),
    inputDecorationTheme: _inputDecorationTheme(Colors.white, Colors.black45),
    iconTheme: IconThemeData(color: _primaryColor),
    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: _primaryColor, foregroundColor: Colors.white),
    bottomNavigationBarTheme: _bottomNavigationBarTheme(Colors.white, _primaryColor, Colors.black54),
    cardTheme: _cardTheme(Colors.white, Colors.black12),
    switchTheme: _switchTheme(_primaryColor),
    checkboxTheme: _checkboxTheme(_primaryColor),
    sliderTheme: _sliderTheme(_primaryColor),
    tabBarTheme: _tabBarTheme(_primaryColor, Colors.black54),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: _primaryColor),
    dividerTheme: DividerThemeData(color: Colors.black26, thickness: 1),
    tooltipTheme: TooltipThemeData(decoration: BoxDecoration(color: _primaryColor, borderRadius: BorderRadius.circular(8))),
    popupMenuTheme: PopupMenuThemeData(color: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_borderRadius))),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: _primaryColor,
    scaffoldBackgroundColor: Color(0xFF121212),
    colorScheme: ColorScheme.dark(primary: _primaryColor, secondary: _secondaryColor),
    appBarTheme: _appBarTheme(Color(0xFF1E1E1E), Colors.white),
    textTheme: _darkTextTheme,
    elevatedButtonTheme: _elevatedButtonTheme(Brightness.dark),
    inputDecorationTheme: _inputDecorationTheme(Color(0xFF1E1E1E), Colors.white54),
    iconTheme: IconThemeData(color: Colors.white),
    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: _primaryColor, foregroundColor: Colors.white),
    bottomNavigationBarTheme: _bottomNavigationBarTheme(Color(0xFF1E1E1E), _primaryColor, Colors.white54),
    cardTheme: _cardTheme(Color(0xFF1E1E1E), Colors.white12),
    switchTheme: _switchTheme(_primaryColor),
    checkboxTheme: _checkboxTheme(_primaryColor),
    sliderTheme: _sliderTheme(_primaryColor),
    tabBarTheme: _tabBarTheme(_primaryColor, Colors.white54),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: _primaryColor),
    dividerTheme: DividerThemeData(color: Colors.white30, thickness: 1),
    tooltipTheme: TooltipThemeData(decoration: BoxDecoration(color: _primaryColor, borderRadius: BorderRadius.circular(8))),
    popupMenuTheme: PopupMenuThemeData(color: Color(0xFF1E1E1E), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_borderRadius))),
  );

  static AppBarTheme _appBarTheme(Color bgColor, Color fgColor) => AppBarTheme(
    backgroundColor: bgColor,
    foregroundColor: fgColor,
    elevation: 3,
    titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: fgColor),
  );

  static BottomNavigationBarThemeData _bottomNavigationBarTheme(Color bgColor, Color selected, Color unselected) => BottomNavigationBarThemeData(
    backgroundColor: bgColor,
    selectedItemColor: selected,
    unselectedItemColor: unselected,
  );

  static TextTheme _lightTextTheme = TextTheme(

    displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
    displayMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black87),
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black87),
    bodyMedium: TextStyle(fontSize: 14, color: Colors.black54),
  );

  static TextTheme _darkTextTheme = TextTheme(
    displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
    displayMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white70),
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white70),
    bodyMedium: TextStyle(fontSize: 14, color: Colors.white54),
  );

  static ElevatedButtonThemeData _elevatedButtonTheme(Brightness brightness) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: brightness == Brightness.dark ? Colors.grey : _primaryColor,
        foregroundColor: Colors.white,
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_borderRadius)),
        padding: _buttonPadding,
      ),
    );
  }


  static InputDecorationTheme _inputDecorationTheme(Color fillColor, Color hintColor) => InputDecorationTheme(
    filled: true,
    fillColor: fillColor,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(_borderRadius)),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: _primaryColor, width: 2), borderRadius: BorderRadius.circular(_borderRadius)),
    hintStyle: TextStyle(color: hintColor),
  );

  static CardTheme _cardTheme(Color bgColor, Color shadowColor) => CardTheme(
    color: bgColor,
    shadowColor: shadowColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_borderRadius)),
    elevation: 4,
  );

  static SwitchThemeData _switchTheme(Color activeColor) => SwitchThemeData(
    trackColor: MaterialStateProperty.resolveWith<Color>((states) => states.contains(MaterialState.selected) ? activeColor : Colors.grey),
    thumbColor: MaterialStateProperty.all(Colors.white),
  );

  static CheckboxThemeData _checkboxTheme(Color activeColor) => CheckboxThemeData(
    checkColor: MaterialStateProperty.all(Colors.white),
    fillColor: MaterialStateProperty.all(activeColor),
  );

  static SliderThemeData _sliderTheme(Color activeColor) => SliderThemeData(
    activeTrackColor: activeColor,
    inactiveTrackColor: activeColor.withOpacity(0.5),
    thumbColor: activeColor,
    overlayColor: activeColor.withOpacity(0.2),
    valueIndicatorColor: activeColor,
  );

  static TabBarTheme _tabBarTheme(Color indicatorColor, Color labelColor) => TabBarTheme(
    indicator: BoxDecoration(border: Border(bottom: BorderSide(color: indicatorColor, width: 2))),
    labelColor: labelColor,
    unselectedLabelColor: Colors.grey,
  );
}

//The `AppTheme` class defines a unified light and dark theme for a Flutter app,
// covering colors, typography, and styling for all widgets.
// It centralizes theme properties like buttons, inputs, cards, switches,
// and sliders for consistency. The implementation ensures a visually cohesive UI across light and dark modes.