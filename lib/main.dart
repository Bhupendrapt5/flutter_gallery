import 'package:cam_gal/helper/routes_name.dart';
import 'package:cam_gal/provider/pictures_provider.dart';
import 'package:cam_gal/screen/cam_screen.dart';
import 'package:cam_gal/screen/galley_screen.dart';
import 'package:cam_gal/screen/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PicturesProvider>(
          create: (_) => PicturesProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        routes: {
          RouteNames.camScreen :(ctx) => CameraScreen(),
          RouteNames.galScreen :(ctx) => GalleryScreen(),
          RouteNames.homeScreen :(ctx) => TabScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}