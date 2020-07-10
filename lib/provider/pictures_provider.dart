import 'package:cam_gal/model/picture_model.dart';
import 'package:flutter/foundation.dart';


class PicturesProvider with ChangeNotifier {
List<PictureModel> _items = [];

  List<PictureModel> get items {
    return [..._items];
  }
   storeImage(
  PictureModel pickedImage
  )  {
  
    final newImage = PictureModel(
      file: pickedImage.file,
      imageName: pickedImage.imageName
    );
    _items.add(newImage);
    notifyListeners();

    
  }
}
