import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as path;

class PickImageUseCase {
  final ImagePicker _picker = ImagePicker();

  Future<ImageUploadData?> pickImageFromGallery() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    return await _handlePickedFile(pickedFile);
  }

  Future<ImageUploadData?> pickImageFromCamera() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);
    return await _handlePickedFile(pickedFile);
  }

  Future<ImageUploadData?> _handlePickedFile(XFile? pickedFile) async {
    if (pickedFile == null) return null;

    final File? croppedFile = await _cropImage(pickedFile.path);
    if (croppedFile == null) return null;

    final Uint8List bytes = await croppedFile.readAsBytes();
    final file = File(croppedFile.path);
    final image = MemoryImage(bytes);
    final base64 = base64Encode(bytes);
    final fileName =
        'img_${const Uuid().v4()}${path.extension(croppedFile.path)}';

    debugPrint('✅ Image selected and cropped: $fileName');

    return ImageUploadData(
      image: image,
      file: file,
      fileName: fileName,
      base64: base64,
    );
  }

  Future<File?> _cropImage(String imagePath) async {
    final CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imagePath,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: "قص الصورة",
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9,
          ],
        ),
        
        IOSUiSettings(
          title: 'قص الصورة',
          aspectRatioLockEnabled: false,
        ),
      ],
    );

    if (croppedFile?.path != null) {
      debugPrint("✅ Cropped image path: ${croppedFile!.path}");
      return File(croppedFile.path);
    } else {
      debugPrint("❌ Image cropping canceled");
      return null;
    }
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
