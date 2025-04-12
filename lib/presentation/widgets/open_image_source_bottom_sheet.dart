import 'package:flutter/material.dart';
import 'package:scan_canser_detection/core/constants/colors.dart';
import 'package:scan_canser_detection/data/use_cases/pickImage_use_case.dart';

void openImageSourceBottomSheet(
  BuildContext context,
  // Function(ImageUploadData) onImagePicked,
) {
  final imagePicker = PickImageUseCase();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera, color: AppColors.primaryColor),
              title: const Text("Take a Photo"),
              onTap: () async {
                Navigator.pop(context);
                final data = await imagePicker.pickImageFromCamera();
                // if (data != null) onImagePicked(data);
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.photo_album, color: AppColors.primaryColor),
              title: const Text("Choose from Gallery"),
              onTap: () async {
                Navigator.pop(context);
                final data = await imagePicker.pickImageFromGallery();
                // if (data != null) onImagePicked(data);
              },
            ),
          ],
        ),
      );
    },
  );
}
