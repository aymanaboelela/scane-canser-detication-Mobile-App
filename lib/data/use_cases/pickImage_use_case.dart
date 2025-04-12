import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as path;

class PickImageUseCase {
  final ImagePicker _picker = ImagePicker();

  Future<ImageUploadData?> pickImageFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    return _handlePickedFile(pickedFile);
  }

  Future<ImageUploadData?> pickImageFromCamera() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    return _handlePickedFile(pickedFile);
  }

  Future<ImageUploadData?> _handlePickedFile(XFile? pickedFile) async {
    if (pickedFile == null) return null;

    final Uint8List bytes = await pickedFile.readAsBytes();
    final file = File(pickedFile.path);
    final image = MemoryImage(bytes);
    final base64 = base64Encode(bytes);
    final fileName = 'img_${const Uuid().v4()}${path.extension(pickedFile.path)}';

    return ImageUploadData(
      image: image,
      file: file,
      fileName: fileName,
      base64: base64,
    );
  }
}


class ImageUploadData {
  final ImageProvider image;
  final File file;
  final String fileName;
  final String base64;

  ImageUploadData({
    required this.image,
    required this.file,
    required this.fileName,
    required this.base64,
  });
}