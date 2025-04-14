import 'dart:io';

class DetectionModel {
  final String? id;
  final String? imagePath;
  final File? image;
  final String name;
  final String? patientId;
  final String description;
  final String? malignancyStatus;
  final String probability;

  DetectionModel({
    this.id,
    this.imagePath,
    this.image,
    required this.name,
    this.patientId,
    this.malignancyStatus,
    required this.description,
    required this.probability,
  });

  factory DetectionModel.fromMap(Map<String, dynamic> map) {
    return DetectionModel(
      id: map['id'],
      malignancyStatus: map['malignancy_status'],
      imagePath: map['image_path'],
      name: map['name'],
      patientId: map['patient_id'],
      description: map['description'] ?? '',
      probability: (map['probability']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image_path': imagePath,
      'name': name,
      "malignancy_status": malignancyStatus,
      'patient_id': patientId,
      'description': description,
      'probability': probability,
    };
  }
}
