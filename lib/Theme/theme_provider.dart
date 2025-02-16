
import 'package:flutter/material.dart';


class ThemeProvider extends ChangeNotifier{
 late ThemeData _selectedTheme;


 ThemeData light = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
   background: Colors.grey.shade400,
   primary: Colors.grey.shade300,
   secondary: Colors.grey.shade200,
  ),
 );

 ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
   background: Colors.grey.shade900,
   primary: Colors.grey.shade800,
   secondary: Colors.grey.shade700,
  ),
 );


  ThemeProvider({required bool isDarkMode}){
    _selectedTheme = isDarkMode ? dark : light;
  }
ThemeData get getTheme => _selectedTheme;

  void swapTheme() {

   _selectedTheme = _selectedTheme == dark ? light : dark;
   notifyListeners();
  }


}