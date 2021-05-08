import 'package:app/util/textdesign.dart';
import 'package:flutter/material.dart';

class LogoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            TextDesign(
              'Awesome App',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            )
          ],
        ),
      ),
    );
  }
}
