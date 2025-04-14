class DiagnosisModel {
  final String primaryDiagnosis;
  final String malignancyStatus;
  final String confidenceLevel;
  final String actionRequired;

  DiagnosisModel({
    required this.primaryDiagnosis,
    required this.malignancyStatus,
    required this.confidenceLevel,
    required this.actionRequired,
  });

  factory DiagnosisModel.fromJson(Map<String, dynamic> json) {
    return DiagnosisModel(
      primaryDiagnosis: json['Primary diagnosis'] ?? '',
      malignancyStatus: json['Malignancy status'] ?? '',
      confidenceLevel: json['Confidence level'] ?? '',
      actionRequired: json['Action required'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Diagnosis: $primaryDiagnosis\nStatus: $malignancyStatus\nConfidence: $confidenceLevel\nAction: $actionRequired';
  }
}
