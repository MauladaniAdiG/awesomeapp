import 'package:app/util/navanimate.dart';
import 'package:flutter/material.dart';

Future pushNav(BuildContext context, Widget className, bool useAnimate) async {
  return useAnimate
      ? Navigator.push(context, AnimateRoute(className: className))
      : Navigator.push(
          context, MaterialPageRoute(builder: (context) => className));
}

Future pushReplaceNav(
    BuildContext context, Widget className, bool useAnimate) async {
  return useAnimate
      ? Navigator.pushReplacement(context, AnimateRoute(className: className))
      : Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => className));
}

Future pushRemoveNav(
    BuildContext context, Widget className, bool useAnimate) async {
  return useAnimate
      ? Navigator.pushAndRemoveUntil(
          context, AnimateRoute(className: className), (route) => false)
      : Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => className), (route) => false);
}

void popNav(BuildContext context) async {
  return Navigator.pop(context);
}
