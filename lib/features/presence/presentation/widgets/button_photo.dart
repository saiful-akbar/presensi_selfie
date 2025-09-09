import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ButtonPhoto extends StatefulWidget {
  const ButtonPhoto({super.key});

  @override
  State<ButtonPhoto> createState() => _ButtonPhotoState();
}

class _ButtonPhotoState extends State<ButtonPhoto> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  // Buka kamera
  Future<void> _openCamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      setState(() {
        _image = File(photo.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: CircleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.primary,
          width: 5,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () => _openCamera(),
        child: CircleAvatar(
          radius: 100,
          child: _image == null
              ? Icon(Icons.camera_alt, size: 100)
              : ClipOval(
                  child: Image.file(
                    _image!,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
        ),
      ),
    );
  }
}
