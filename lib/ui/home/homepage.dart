import 'package:app/ui/home/components/homelayout.dart';
import 'package:app/util/responsivebase.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: PreferredSize(
            child: AppBar(
              backgroundColor: const Color(0xffffffff),
              elevation: 0,
            ),
            preferredSize: Size.fromHeight(0)),
        body: ResponsiveBase(tablet: HomeLayout(), mobile: HomeLayout()));
  }
}
