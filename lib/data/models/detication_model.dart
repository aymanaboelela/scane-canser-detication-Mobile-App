class DetectionModel {
  final String id;
  final String imagePath;
  final String name;
  final String patientId;
  final String description;
  final double probability;

  DetectionModel({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.patientId,
    required this.description,
    required this.probability,
  });

  factory DetectionModel.fromMap(Map<String, dynamic> map) {
    return DetectionModel(
      id: map['id'],
      imagePath: map['image_path'],
      name: map['name'],
      patientId: map['patient_id'],
      description: map['description'] ?? '',
      probability: (map['probability'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
   
      'image_path': imagePath,
      'name': name,
      'patient_id': patientId,
      'description': description,
      'probability': probability,
    };
  }
}
