import 'dart:io';

import 'package:cam_gal/model/picture_model.dart';
import 'package:cam_gal/provider/pictures_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as pPath;
import 'package:provider/provider.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File _takenImage;
  final picker = ImagePicker();
  Future<void> _takePicture() async {
    final imageFile = await picker.getImage(
      source: ImageSource.camera,
    );
    if (imageFile == null) {
      return;
    }
    setState(() {
      _takenImage = File(imageFile.path);
    });
    final appDir = await pPath.getApplicationDocumentsDirectory();
    final fileName = path.basename(_takenImage.path);
    final savedImage = await _takenImage.copy('${appDir.path}/$fileName');

    var _imageToStore = PictureModel(
        file: savedImage,
        imageName: 'IMG_' +
            DateTime.now().toString().replaceAll(new RegExp(r'[-.:\s]'), ''));
    _storeImage() {
      Provider.of<PicturesProvider>(context, listen: false)
          .storeImage(_imageToStore);
    }

    _storeImage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FlatButton.icon(
          icon: Icon(
            Icons.photo_camera,
            size: 100,
            color: Colors.red,
          ),
          label: Text(''),
          textColor: Theme.of(context).primaryColor,
          onPressed: _takePicture,
        ),
      ),
    );
  }
}
