import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../basic_view.dart';
import 'image_picker_viewmodel.dart';

class ImagePickerView extends BasicView<ImagePickerViewModel> {
  @override
  bool get reactive => true;

  @override
  Widget builder(
      BuildContext context, ImagePickerViewModel model, Widget? child) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Image Picker'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.image),
                onPressed: () => model.getImage(ImageSource.gallery),
              ),
            ],
          ),
          body: Center(
            child: model.image?.path == null
                ? const Text('No image selected.')
                : Image.file(File(model.image?.path ?? "")),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => model.getImage(ImageSource.camera),
            tooltip: 'Pick Image',
            child: const Icon(Icons.add_a_photo),
          ),
        ),
        onWillPop: () async {
          if (model.image != null) {
            Navigator.of(context).pop(model.image?.path);
            return false;
          } else {
            return true;
          }
        });
  }

  @override
  ImagePickerViewModel viewModelBuilder(BuildContext context) =>
      ImagePickerViewModel();
}
