import 'dart:io';

import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';

Future<bool> isSkinImage(File file) async {
  final InputImage inputImage = InputImage.fromFile(file);
  final ImageLabeler labeler =
      ImageLabeler(options: ImageLabelerOptions(confidenceThreshold: 0.6));

  final List<ImageLabel> labels = await labeler.processImage(inputImage);

  for (final label in labels) {
    final labelText = label.label.toLowerCase();
    if (labelText.contains('skin') ||
        labelText.contains('dermatology') ||
        labelText.contains('human body')) {
      return true;
    }
  }

  return false;
}
