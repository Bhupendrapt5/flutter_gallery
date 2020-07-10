import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/picture_model.dart';

class ImageItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pic = Provider.of<PictureModel>(context, listen: false);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(blurRadius: 20),
        ],
      ),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
      height: 250,
      child:  Image.file(
        pic.file,
        fit: BoxFit.cover,
      ),
    );
  }
}