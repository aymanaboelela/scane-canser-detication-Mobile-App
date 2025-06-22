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
        'http://52.207.65.68:8000/analyze/',
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );

      if (response.statusCode == 200) {
        return Right(DiagnosisModel.fromPlainText(response.data.toString()));
      } else {
        return Left(_handleErrorMessage(response.data.toString()));
      }
    } catch (e) {
      if (e is DioException && e.response != null) {
        return Left(_handleErrorMessage(e.response?.data.toString() ?? ''));
      }

      return Left(Failure('Unexpected error: $e'));
    }
  }

  Failure _handleErrorMessage(String message) {
    if (message.contains('Image resolution is too low')) {
      return Failure(
        'The image resolution is too low. Please upload an image with at least 200x200 pixels.',
      );
    }

    if (message.contains('severe compression artifacts')) {
      return Failure(
        'The image appears to be heavily compressed. Please use a clearer image.',
      );
    }

    if (message.contains('not skin') || message.contains('not a skin')) {
      return Failure(
        'The image does not appear to be a skin lesion. Please upload a valid skin photo.',
      );
    }

    if (message.contains('low quality')) {
      return Failure(
        'The image quality is too low. Try using a high-quality image.',
      );
    }

    return Failure('Server error: $message');
  }
}
