import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scan_canser_detection/data/models/diagnosis_model.dart';
import 'package:scan_canser_detection/data/servies/diagnosis_repository.dart';

part 'diagnosis_state.dart';

class DiagnosisCubit extends Cubit<DiagnosisState> {
  final DiagnosisRepository repository;

  DiagnosisCubit({required this.repository}) : super(DiagnosisInitial());

  Future<void> analyzeImage(File image) async {
    emit(DiagnosisLoading());

    final result = await repository.analyzeImage(image);

    result.fold(
      (failure) => emit(DiagnosisError(failure.message)),
      (model) => emit(DiagnosisSuccess(model)),
    );
  }
}
