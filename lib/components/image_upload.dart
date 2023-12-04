import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageUpload extends StatefulWidget {
  final Function onSelectImage;

  ImageUpload(this.onSelectImage);

  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  // Capturando Imagem
  File? _storedImage;

  // Tirar Foto
  Future<void> _takePicture() async {
    final ImagePicker _picker = ImagePicker();
    XFile imageFile = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    ) as XFile;

    if (imageFile == null) return;

    _saveImage(imageFile.path);
  }

  // Selecionar da Galeria
  Future<void> _pickImageFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    XFile imageFile = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    ) as XFile;

    if (imageFile == null) return;

    _saveImage(imageFile.path);
  }

  // Salvar imagem no dispositivo
  Future<void> _saveImage(String imagePath) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    String fileName = path.basename(imagePath);

    try {
      final savedImage = await File(imagePath).copy('${appDir.path}/$fileName');
      setState(() {
        _storedImage = savedImage;
      });
      widget.onSelectImage(savedImage);
    } catch (e) {
      print("Upload da imagem:" + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          alignment: Alignment.center,
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : Text('Nenhuma Imagem!'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              icon: Icon(Icons.camera),
              label: Text(
                'Câmera',
                style: TextStyle(fontSize: 12),
              ),
              onPressed: _takePicture,
            ),
            SizedBox(width: 10),
            TextButton.icon(
              icon: Icon(Icons.image),
              label: Text(
                'Galeria',
                style: TextStyle(fontSize: 12),
              ),
              onPressed: _pickImageFromGallery,
            ),
          ],
        ),
      ],
    );
  }
}
