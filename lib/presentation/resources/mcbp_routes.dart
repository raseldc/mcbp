import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mcbp/presentation/home/home_page.dart';

import '../talika/registration_edit.dart';

class AppRoutes{
  static String loginRoute = "/login";
  static String homeRoute = "/home";
  static String registerRoute = "/register";
  static const String editRegister = "/updateRegister";
}

// class RouteGenerator{
//   static Route<dynamic> getRoute(RouteSettings routeSettings){
//     switch(routeSettings.name){
//       case AppRoutes.editRegister:
//         return MaterialPageRoute(builder: (_) => RegistrationEdit());
//       default:
//         return MaterialPageRoute(builder: (_) => HomePage());
//     }
//   }
// }