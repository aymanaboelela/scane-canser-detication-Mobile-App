part of 'detiction_cubit.dart';

@immutable
abstract class DetictionState {}

class DetictionInitial extends DetictionState {}

class DetictionLoading extends DetictionState {}

class DetictionSuccess extends DetictionState {}

class DetictionFailure extends DetictionState {
  final String message;

  DetictionFailure(this.message);
}


class DetictionLoaded extends DetictionState {
  final List<DetectionModel> detections;
  DetictionLoaded(this.detections);
}