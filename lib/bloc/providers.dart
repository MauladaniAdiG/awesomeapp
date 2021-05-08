import 'package:app/bloc/notifier/detailnotifier.dart';
import 'package:app/bloc/notifier/photosnotifier.dart';
import 'package:app/bloc/repository/photosrepo.dart';
import 'package:app/models/pojo/photoscount.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final photosRepoProvider =
    Provider.autoDispose<PhotosRepo>((ref) => PhotosRepoFake());

final photosNotifierProvider = StateNotifierProvider.autoDispose(
    (ref) => PhotosNotifier(ref.watch(photosRepoProvider)));

final detailPhotosNotifierProvider = StateNotifierProvider.autoDispose(
    (ref) => DetailNotifier(ref.watch(photosRepoProvider)));

final changeView = StateProvider<bool>((ref) => false);
final headImage =
    StateProvider<PhotosCount>((ref) => PhotosCount(photosList: []));
