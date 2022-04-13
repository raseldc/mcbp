import 'package:flutter/widgets.dart';

class ColorManager{
  static Color primary = HexColor.fromHex("4D96FF");
  static Color lightGrey = HexColor.fromHex("D1D1D1");
  static Color midGrey = HexColor.fromHex("7897AB");
  static Color darkGrey = HexColor.fromHex("7897AB");
  static Color errorColor = HexColor.fromHex("F05454");
  static Color cardColor = HexColor.fromHex("F7F7F7");
  static Color greenColor = HexColor.fromHex("4E9F3D");
}

extension HexColor on Color{
  static Color fromHex(String hexColorString){
    hexColorString = hexColorString.replaceAll('#', '');
    if(hexColorString.length == 6){
      hexColorString = "FF" + hexColorString;
    }

    return Color(int.parse(hexColorString,radix:16));
  }
}