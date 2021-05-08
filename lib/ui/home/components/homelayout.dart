import 'package:app/bloc/providers.dart';
import 'package:app/ui/detail/detailpage.dart';
import 'package:app/ui/home/components/homeinfo.dart';
import 'package:app/util/navigator.dart';
import 'package:app/util/sizer.dart';
import 'package:app/util/textdesign.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  bool isCollapse = false;
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
                expandedHeight: sHeight(context) * 0.25,
                backgroundColor: const Color(0xffbc85a3),
                pinned: true,
                floating: false,
                actions: [
                  Consumer(
                    builder: (context, watch, child) {
                      watch(changeView).state;
                      return Row(
                        children: [
                          InkWell(
                            onTap: () {
                              context.read(changeView).state = false;
                            },
                            child: Container(
                                padding: EdgeInsets.only(right: 5),
                                child: Icon(
                                  Icons.dashboard,
                                  color: context.read(changeView).state
                                      ? Colors.white
                                      : Colors.black,
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              context.read(changeView).state = true;
                            },
                            child: Container(
                                padding: EdgeInsets.only(right: 15, left: 5),
                                child: Icon(
                                  Icons.menu,
                                  color: context.read(changeView).state
                                      ? Colors.black
                                      : Colors.white,
                                )),
                          )
                        ],
                      );
                    },
                  )
                ],
                flexibleSpace: LayoutBuilder(
                  builder: (context, constraint) {
                    double hider = constraint.biggest.height;
                    return FlexibleSpaceBar(
                        background: Consumer(
                          builder: (context, watch, child) {
                            final state = watch(headImage).state;
                            if (state.photosList!.isEmpty) {
                              return Image.network(
                                'https://4.bp.blogspot.com/-Mo6-hxI05KA/W_VOHlv-G8I/AAAAAAAAHBI/bxkbb8rhceo83-fS2enESJMjKzK9BXv7ACLcBGAs/s1600/flat%2Bdesign%2B1.jpg',
                                fit: BoxFit.cover,
                                width: sWidth(context),
                              );
                            } else {
                              return InkWell(
                                onTap: () {
                                  pushNav(
                                      context,
                                      DetailPage(
                                        id: state.photosList![0].id,
                                      ),
                                      false);
                                },
                                child: Image.network(
                                  '${state.photosList![0].photosSource!.original}',
                                  fit: BoxFit.cover,
                                ),
                              );
                            }
                          },
                        ),
                        collapseMode: CollapseMode.pin,
                        titlePadding:
                            EdgeInsetsDirectional.only(start: 20, bottom: 16),
                        title: AnimatedOpacity(
                            opacity: hider == kToolbarHeight ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 300),
                            child: TextDesign(
                                hider == kToolbarHeight
                                    ? 'Awesome Apps'
                                    : 'None',
                                fontColor: hider == kToolbarHeight
                                    ? Colors.white
                                    : Colors.transparent)));
                  },
                )),
          ];
        },
        body: HomeInfo());
  }
}
