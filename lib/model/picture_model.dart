import 'dart:io';

import 'package:flutter/material.dart';

class PictureModel with ChangeNotifier {
  final File file;
  final String imageName;

  PictureModel({
    @required this.file,
    @required this.imageName, picName,
  });
}
