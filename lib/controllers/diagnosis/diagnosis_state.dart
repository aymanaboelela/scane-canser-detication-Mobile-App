part of 'diagnosis_cubit.dart';

@immutable
abstract class DiagnosisState {}

class DiagnosisInitial extends DiagnosisState {}

class DiagnosisLoading extends DiagnosisState {}

class DiagnosisSuccess extends DiagnosisState {
  final DiagnosisModel diagnosis;

  DiagnosisSuccess(this.diagnosis);
}

class DiagnosisError extends DiagnosisState {
  final String message;

  DiagnosisError(this.message);
}
