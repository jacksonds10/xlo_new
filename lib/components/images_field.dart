import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xlo_new/components/image_source_model.dart';
import 'package:xlo_new/store/create_store.dart';

class ImagesField extends StatelessWidget {
  ImagesField(this.createStore);
  final CreateStore createStore;

  @override
  Widget build(BuildContext context) {
    void onImageSelect(File image) {
      createStore.images.add(image);
    }

    return Container(
      color: Colors.grey[200],
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: createStore.images.length + 1,
        itemBuilder: (_, index) {
          if (index == createStore.images.length) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
              child: GestureDetector(
                onTap: () {
                  if (Platform.isAndroid) {
                    showModalBottomSheet(
                      context: context,
                      builder: (_) => ImageSourceModel(onImageSelect),
                    );
                  } else {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (_) => ImageSourceModel(onImageSelect),
                    );
                  }
                },
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[300],
                  child: Icon(
                    Icons.camera_alt,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
              child: GestureDetector(
                onTap: () {
                  // Add your onTap logic here if needed
                },
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: FileImage(createStore.images[index]),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
