import 'package:app/bloc/providers.dart';
import 'package:app/models/pojo/photoscount.dart';
import 'package:app/ui/detail/detailpage.dart';
import 'package:app/util/navigator.dart';
import 'package:app/util/sizer.dart';
import 'package:app/util/textdesign.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewItem extends StatefulWidget {
  final PhotosCount? photosCount;
  const ViewItem({this.photosCount});
  @override
  _ViewItemState createState() => _ViewItemState();
}

class _ViewItemState extends State<ViewItem> {
  @override
  Widget build(BuildContext context) {
    return context.read(changeView).state ? _listViewBuild() : _gridViewBuild();
  }

  Widget _gridViewBuild() {
    return Container(
      child: GridView.builder(
          padding: const EdgeInsets.all(25),
          itemCount: widget.photosCount!.photosList!.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 25,
              crossAxisSpacing: 35,
              childAspectRatio: 0.7),
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () {
                pushNav(
                    context,
                    DetailPage(
                      id: widget.photosCount!.photosList![i].id,
                    ),
                    false);
              },
              child: PhysicalModel(
                color: const Color(0xffffffff),
                elevation: 4,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          width: sWidth(context),
                          child: Image.network(
                            '${widget.photosCount!.photosList![i].photosSource!.large}',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          children: [
                            RichText(
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                    text:
                                        '${widget.photosCount!.photosList![i].photographer}',
                                    style: MyTextStyle(
                                        fontColor: const Color(0xff000000),
                                        fontSize:
                                            sWidth(context) <= 320 ? 10 : 14),
                                    children: [
                                      TextSpan(
                                        text:
                                            '\n${widget.photosCount!.photosList![i].photographerUrl}',
                                        style: MyTextStyle(
                                            fontColor: const Color(0xff000000),
                                            fontSize: sWidth(context) <= 320
                                                ? 8
                                                : 12),
                                      )
                                    ])),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget _listViewBuild() {
    return Container(
      child: ListView.builder(
          padding: const EdgeInsets.all(25),
          itemCount: widget.photosCount!.photosList!.length,
          itemBuilder: (context, i) {
            return Container(
              margin: EdgeInsets.only(bottom: 25),
              child: InkWell(
                onTap: () {
                  pushNav(
                      context,
                      DetailPage(
                        id: widget.photosCount!.photosList![i].id,
                      ),
                      false);
                },
                child: PhysicalModel(
                  color: const Color(0xffffffff),
                  elevation: 4,
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            height: sHeight(context) * 0.15,
                            child: Image.network(
                              '${widget.photosCount!.photosList![i].photosSource!.large}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  text: TextSpan(
                                      text:
                                          '${widget.photosCount!.photosList![i].photographer}\n',
                                      style: MyTextStyle(
                                        fontColor: const Color(0xff000000),
                                      ),
                                      children: [
                                        TextSpan(
                                          text:
                                              '${widget.photosCount!.photosList![i].photographerUrl}',
                                        )
                                      ])),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
