import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextDesign extends StatelessWidget {
  final String data;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final Color? fontColor;
  final double? fontSize;
  final bool? softWrap;
  final FontWeight? fontWeight;
  const TextDesign(this.data,
      {this.maxLines,
      this.textOverflow,
      this.textAlign,
      this.fontColor = const Color(0xff000000),
      this.fontSize,
      this.softWrap,
      this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Text(data,
        maxLines: maxLines,
        softWrap: softWrap,
        overflow: textOverflow,
        textAlign: textAlign,
        style: GoogleFonts.roboto(
            fontSize: fontSize, color: fontColor, fontWeight: fontWeight));
  }
}

class MyTextStyle extends TextStyle {
  final Color? fontColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  const MyTextStyle({
    this.fontColor = const Color(0xff000000),
    this.fontSize,
    this.fontWeight,
  }) : super(color: fontColor, fontWeight: fontWeight, fontSize: fontSize);
}
