import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:scan_canser_detection/core/utils/errors.dart';
import 'package:scan_canser_detection/data/models/diagnosis_model.dart';

abstract class DiagnosisRepository {
  Future<Either<Failure, DiagnosisModel>> analyzeImage(File file);
}