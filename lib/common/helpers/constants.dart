import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

///Mediaquery Height
double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

///MediaQuery Width
double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

String getEnumTitle(String value) {
  return value.split('.').last[0].toUpperCase() +
      value.split('.').last.substring(1);
}
