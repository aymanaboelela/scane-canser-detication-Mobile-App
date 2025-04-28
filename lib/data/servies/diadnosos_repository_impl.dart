import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:path/path.dart' as p;
import 'package:scan_canser_detection/core/utils/errors.dart';

import '../models/diagnosis_model.dart';
import 'diagnosis_repository.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DiagnosisRepositoryImpl implements DiagnosisRepository {
  final Dio dio;

  DiagnosisRepositoryImpl({Dio? dio})
      : dio = dio ?? Dio()
          ..interceptors.add(_dioLogger);

  static final _dioLogger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 120,
  );

  @override
  Future<Either<Failure, DiagnosisModel>> analyzeImage(File file) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file.path,
          filename: p.basename(file.path),
        ),
      });

      final response = await dio.post(
        'http://13.60.204.213:8000/analyze/',
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );

      if (response.statusCode == 200) {
        return Right(DiagnosisModel.fromJson(response.data));
      } else {
        return Left(Failure('Server error: ${response.statusMessage}'));
      }
    } catch (e) {
      return Left(Failure('Exception: $e'));
    }
  }
}
