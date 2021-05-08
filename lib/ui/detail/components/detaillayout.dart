import 'package:app/bloc/notifier/detailnotifier.dart';
import 'package:app/bloc/providers.dart';
import 'package:app/ui/error/errorhelper.dart';
import 'package:app/util/navigator.dart';
import 'package:app/util/sizer.dart';
import 'package:app/util/textdesign.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailLayout extends StatefulWidget {
  final int? id;
  const DetailLayout({this.id});
  @override
  _DetailLayoutState createState() => _DetailLayoutState();
}

class _DetailLayoutState extends State<DetailLayout> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer(builder: (context, watch, _) {
        final state = watch(detailPhotosNotifierProvider);
        if (state is DetailInit) {
          Future.delayed(
              Duration(
                seconds: 2,
              ), () {
            context
                .read(detailPhotosNotifierProvider.notifier)
                .getDetail(widget.id!);
          });
          return Container();
        } else if (state is DetailLoading) {
          return Container(
            height: sHeight(context),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is DetailLoadEvent) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: sWidth(context),
                      height: sHeight(context) * 0.6,
                      child: Image.network(
                        '${state.photos.photosSource!.large!}',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                        top: 0,
                        child: Container(
                          child: Row(
                            children: [
                              IconButton(
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: const Color(0xffffffff),
                                  ),
                                  onPressed: () {
                                    popNav(context);
                                  }),
                              const SizedBox(
                                width: 10,
                              ),
                              TextDesign(
                                'Detail ${state.photos.photographer}',
                                fontColor: const Color(0xffffffff),
                                fontSize: 18,
                              )
                            ],
                          ),
                        ))
                  ],
                ),
                Container(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextDesign(
                          '${state.photos.photographer}',
                          fontColor: const Color(0xff000000),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                            child: InkWell(
                          onTap: () async {
                            await canLaunch(state.photos.photographerUrl!)
                                ? await launch(state.photos.photographerUrl!)
                                : print('Could not launch');
                          },
                          child: TextDesign(
                            '${state.photos.photographerUrl}',
                            fontColor: const Color(0xff000000),
                          ),
                        )),
                      ],
                    )),
              ],
            ),
          );
        } else if (state is DetailLoadError) {
          return ErrorHelper(
            isDetail: true,
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
