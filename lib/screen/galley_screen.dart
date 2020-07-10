import 'package:cam_gal/provider/pictures_provider.dart';
import 'package:cam_gal/widget/image_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imagesData = Provider.of<PicturesProvider>(context);
    final images = imagesData.items;
    print(images.length);
    return images.length == 0
        ? Center(
            child: Text(
              'Add some images',
              style: TextStyle(
                color: Colors.redAccent,
              ),
            ),
          )
        : ListView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: images.length,
            itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
              value: images[i],
              child: ImageItem(),
            ),
          );
  }
}
