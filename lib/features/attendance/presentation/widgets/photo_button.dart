import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoButton extends StatefulWidget {
  const PhotoButton({super.key});

  @override
  State<PhotoButton> createState() => _PhotoButtonState();
}

class _PhotoButtonState extends State<PhotoButton> {
  File? _image;
  final ImagePicker _imagePicker = ImagePicker();

  // Buka kamera
  Future<void> _openCamera() async {
    final XFile? photo = await _imagePicker.pickImage(
      source: ImageSource.camera,
    );

    if (photo != null) {
      setState(() {
        _image = File(photo.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      shape: CircleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
          width: 5,
        ),
      ),
      child: InkWell(
        onTap: () => _openCamera(),
        customBorder: CircleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 5,
          ),
        ),
        child: CircleAvatar(
          radius: 100,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          child: _image == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.camera_alt, size: 65),
                    Text(
                      'Ambil Foto',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
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
