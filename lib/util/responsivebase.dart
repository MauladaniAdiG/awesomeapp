import 'package:flutter/material.dart';

class ResponsiveBase extends StatefulWidget {
  final Widget tablet;
  final Widget mobile;
  const ResponsiveBase({required this.tablet, required this.mobile});
  @override
  _ResponsiveBaseState createState() => _ResponsiveBaseState();
}

class _ResponsiveBaseState extends State<ResponsiveBase> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      if (boxConstraints.maxWidth >= 600) {
        return widget.tablet;
      } else {
        return widget.mobile;
      }
    });
  }
}
