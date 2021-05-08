import 'package:flutter/material.dart';

double sWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double sHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

bool isMobile(BuildContext context) {
  return MediaQuery.of(context).size.width < 600;
}

bool isTablet(BuildContext context) {
  return MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1100;
}
