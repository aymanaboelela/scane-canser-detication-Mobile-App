import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scan_canser_detection/data/models/detication_model.dart';
import 'package:scan_canser_detection/data/servies/detication_rebo.dart';

part 'detiction_state.dart';

class DetictionCubit extends Cubit<DetictionState> {
  final DetectionService detectionService;

  DetictionCubit(this.detectionService) : super(DetictionInitial());

  Future<void> insertDetection({ required DetectionModel model}) async {
    emit(DetictionLoading());

    final result = await detectionService.insertDetectionModel(model);

    result.fold(
      (failure) => emit(DetictionFailure(failure.message)),
      (_) => emit(DetictionSuccess()),
    );
  }

  Future<void> getDetections() async {
    emit(DetictionLoading());

    final result = await detectionService.getDetectionsForCurrentUser();

    result.fold(
      (failure) => emit(DetictionFailure(failure.message)),
      (data) => emit(DetictionLoaded(data)),
    );
  }

  Future<void> deleteDetection(String id) async {
    emit(DetictionLoading());

    final result = await detectionService.deleteDetection(id);

    result.fold(
      (failure) => emit(DetictionFailure(failure.message)),
      (_) => emit(DetictionSuccess()),
    );
  }
}
