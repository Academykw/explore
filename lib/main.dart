import 'package:flutter/material.dart';
import 'package:my_country/screen/splash.dart';


import 'package:provider/provider.dart';

import 'Theme/theme_provider.dart';

void main() {
  runApp(
     ChangeNotifierProvider(
       create: (BuildContext context) => ThemeProvider(isDarkMode: true),
     child:  const MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context,themeProvider, child){
        return MaterialApp(
          home: Splash(),
          debugShowCheckedModeBanner: false,
          theme: themeProvider.getTheme,
        );
      },
    );
  }
}

