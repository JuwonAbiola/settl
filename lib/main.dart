import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'common/helpers/colors.dart';
import 'screens/contactListScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: primaryColor),
          elevation: 0,
        ),
        primaryColor: primaryColor,
        accentColor: primaryColor,
        textTheme: GoogleFonts.karlaTextTheme(),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ContactListScreen(),
    );
  }
}
