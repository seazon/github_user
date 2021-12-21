import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../basic_viewmodel.dart';

class ImagePickerViewModel extends BasicViewModel {
  XFile? _image;

  XFile? get image => _image;

  Future getImage(ImageSource source) async {
    _image = await ImagePicker().pickImage(source: source);
    notifyListeners();
  }
}
