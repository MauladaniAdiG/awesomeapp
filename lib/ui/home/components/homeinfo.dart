import 'dart:math';

import 'package:app/bloc/notifier/photosnotifier.dart';
import 'package:app/bloc/providers.dart';
import 'package:app/models/pojo/photoscount.dart';
import 'package:app/ui/error/errorhelper.dart';
import 'package:app/ui/home/components/viewitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeInfo extends StatefulWidget {
  @override
  _HomeInfoState createState() => _HomeInfoState();
}

class _HomeInfoState extends State<HomeInfo> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, _) {
      final state = watch(photosNotifierProvider);
      watch(changeView).state;
      if (state is PhotosInit) {
        Future.delayed(
            Duration(
              seconds: 2,
            ), () {
          context
              .read(photosNotifierProvider.notifier)
              .getPhotos(1, 20)!
              .then((value) {
            if (value != null) {
              Random _random = Random();
              PhotosCount dummy = value;
              context.read(headImage).state = PhotosCount(
                  nextPage: dummy.nextPage,
                  page: dummy.page,
                  perPage: dummy.perPage,
                  photosList: [
                    dummy.photosList![_random.nextInt(dummy.photosList!.length)]
                  ],
                  prevPage: dummy.prevPage,
                  totalResult: dummy.totalResult);
            }
          });
        });
        return Container();
      } else if (state is PhotosLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is PhotosLoadEvent) {
        return NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification.metrics.pixels ==
                  scrollNotification.metrics.maxScrollExtent) {
                context
                    .read(photosNotifierProvider.notifier)
                    .getMorePhotos(
                        state.photosCount.nextPage!, state.photosCount)!
                    .then((value) {
                  if (value != null) {
                    Random _random = Random();
                    PhotosCount dummy = value;
                    context.read(headImage).state = PhotosCount(
                        nextPage: dummy.nextPage,
                        page: dummy.page,
                        perPage: dummy.perPage,
                        photosList: [
                          dummy.photosList![
                              _random.nextInt(dummy.photosList!.length)]
                        ],
                        prevPage: dummy.prevPage,
                        totalResult: dummy.totalResult);
                  }
                });
              }

              return false;
            },
            child: ViewItem(
              photosCount: state.photosCount,
            ));
      } else if (state is PhotosLoadError) {
        return ErrorHelper();
      } else {
        return Container();
      }
    });
  }
}
