import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mcbp/modules/dashboards/screens/home_page.dart';
import 'package:mcbp/modules/dashboards/screens/login_screens.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "First App",
        theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: GoogleFonts.poppins().fontFamily,
          primaryTextTheme: GoogleFonts.poppinsTextTheme(),
        ),
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        routes: {
          "/": (context) => LoginScreen(),
          "/home": (context) => HomePage(),
          "/login" : (context) => LoginScreen()
        },
    );
  }
}
