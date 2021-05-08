import 'package:app/bloc/providers.dart';
import 'package:app/util/sizer.dart';
import 'package:app/util/textdesign.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorHelper extends StatefulWidget {
  final bool? isDetail;
  const ErrorHelper({this.isDetail = false});
  @override
  _ErrorHelperState createState() => _ErrorHelperState();
}

class _ErrorHelperState extends State<ErrorHelper> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: widget.isDetail! ? sHeight(context) : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: FaIcon(
              FontAwesomeIcons.images,
              size: sHeight(context) * 0.1,
            )),
            const SizedBox(height: 10),
            TextDesign(
                widget.isDetail!
                    ? "Hey, something wrong with this detail"
                    : "Ouuchh, don't worry lets connect again",
                textAlign: TextAlign.center),
            const SizedBox(height: 10),
            Container(
                width: sWidth(context) * 0.5,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xffbc85a3))),
                    onPressed: () {
                      if (widget.isDetail!) {
                        context
                            .read(detailPhotosNotifierProvider.notifier)
                            .backToTheInit();
                      } else {
                        context
                            .read(photosNotifierProvider.notifier)
                            .backToTheInit();
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextDesign(
                        'Connect',
                        fontColor: const Color(0xffffffff),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
