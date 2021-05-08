import 'package:app/ui/detail/components/detaillayout.dart';
import 'package:app/util/responsivebase.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final int? id;
  const DetailPage({this.id});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: PreferredSize(
            child: AppBar(
              backgroundColor: const Color(0xffffffff),
            ),
            preferredSize: Size.fromHeight(0)),
        body: ResponsiveBase(
            tablet: DetailLayout(
              id: widget.id,
            ),
            mobile: DetailLayout(
              id: widget.id,
            )));
  }
}
