import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mcbp/presentation/home/home_page.dart';
import 'package:mcbp/presentation/login/login_screens.dart';
import 'package:mcbp/presentation/resources/mcbp_routes.dart';
import 'package:mcbp/presentation/resources/theme.dart';
import 'package:mcbp/presentation/talika/registration_edit.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MCBP",
        theme: getApplicationTheme(),
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        routes: {
          "/": (context) => LoginScreen(),
          "/home": (context) => HomePage(),
          "/login" : (context) => LoginScreen(),
        },
    );
  }
}
