import 'package:app/models/pojo/photos.dart';
import 'package:app/models/pojo/photoscount.dart';
import 'package:app/models/pojo/photossource.dart';
import 'package:app/ui/intro/flashpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String photosBox = "photos";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PhotosCountAdapter());
  Hive.registerAdapter(PhotosAdapter());
  Hive.registerAdapter(PhotosSourceAdapter());
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Awesome App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FlashPage());
  }
}
