class DiagnosisModel {
  final String? primaryDiagnosis;
  final String malignancyStatus;
  final double confidenceLevel;
  final Map<String, double> detailedProbabilities;
  final String medicalRecommendation;

  DiagnosisModel({
    required this.primaryDiagnosis,
    required this.malignancyStatus,
    required this.confidenceLevel,
    required this.detailedProbabilities,
    required this.medicalRecommendation,
  });

  /// JSON constructor (احتياطي لو رجعت JSON)
  factory DiagnosisModel.fromJson(Map<String, dynamic> json) {
    final probs = Map<String, double>.from(
      (json['Detailed Probabilities'] ?? {}).map(
        (key, value) => MapEntry(key.toString(), value.toDouble()),
      ),
    );

    return DiagnosisModel(
      primaryDiagnosis: json['Primary diagnosis'] ?? '',
      malignancyStatus: json['Malignancy status'] ?? '',
      confidenceLevel: (json['Confidence level'] is String)
          ? double.tryParse(json['Confidence level']) ?? 0.0
          : json['Confidence level']?.toDouble() ?? 0.0,
      detailedProbabilities: probs,
      medicalRecommendation: json['Medical Recommendation'] ?? '',
    );
  }

  /// نص عادي (text/plain)
  factory DiagnosisModel.fromPlainText(String text) {
    // تنظيف وتقسيم الأسطر
    final rawLines = text
        .replaceAll('\r\n', '\n')
        .replaceAll('\r', '\n')
        .split('\n')
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .toList();

    // ضم الأسطر المقطوعة
    final lines = <String>[];
    for (int i = 0; i < rawLines.length; i++) {
      final line = rawLines[i];
      if (lines.isNotEmpty &&
          !line.contains(':') &&
          RegExp(r'^[a-z0-9\)]', caseSensitive: false).hasMatch(line)) {
        lines[lines.length - 1] += ' ' + line;
      } else {
        lines.add(line);
      }
    }

    // استخراج قيمة بناءً على بداية السطر
    String extractValue(String key) {
      return lines
          .firstWhere((line) => line.startsWith(key), orElse: () => '')
          .split(':')
          .skip(1)
          .join(':')
          .trim();
    }

    // تحويل نسبة مئوية إلى double
    double parsePercent(String input) {
      return double.tryParse(
            input.replaceAll('%', '').replaceAll(')', '').trim(),
          ) ??
          0.0;
    }

    // استخراج الاحتمالات فقط (DETAILED PROBABILITIES)
    Map<String, double> parseDetailedProbabilities() {
      final startIndex = lines.indexWhere(
        (line) => line.contains('[DETAILED PROBABILITIES]'),
      );
      if (startIndex == -1) return {};

      final endIndex = lines.indexWhere(
        (line) => line.contains('[INDIVIDUAL MODEL PREDICTIONS]'),
      );

      final result = <String, double>{};
      final maxIndex = (endIndex == -1) ? lines.length : endIndex;

      for (int i = startIndex + 1; i < maxIndex; i++) {
        final line = lines[i];
        if (!line.contains(':')) continue;

        final parts = line.split(':');
        final label = parts[0].trim();
        final valueString = parts.sublist(1).join(':').trim();
        result[label] = parsePercent(valueString);
      }

      return result;
    }

    // التوصية الطبية
    final medicalLines = lines
        .skipWhile((line) => !line.contains('[MEDICAL RECOMMENDATION]'))
        .skip(1)
        .take(3)
        .join(' ')
        .trim();

    return DiagnosisModel(
      primaryDiagnosis: extractValue('Primary diagnosis'),
      malignancyStatus: extractValue('Malignancy status'),
      confidenceLevel: double.tryParse(
              extractValue('Confidence level').replaceAll('%', '')) ??
          0.0,
      detailedProbabilities: parseDetailedProbabilities(),
      medicalRecommendation: medicalLines,
    );
  }

  @override
  String toString() {
    return 'Diagnosis: $primaryDiagnosis\n'
        'Status: $malignancyStatus\n'
        'Confidence: ${confidenceLevel.toStringAsFixed(2)}%\n'
        'Recommendation: $medicalRecommendation\n'
        'Probabilities: $detailedProbabilities';
  }
}
