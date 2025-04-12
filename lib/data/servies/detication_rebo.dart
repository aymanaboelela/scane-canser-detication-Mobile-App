import 'package:dartz/dartz.dart';
import 'package:scan_canser_detection/core/utils/errors.dart';
import 'package:scan_canser_detection/data/models/detication_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



class DetectionService {
  final _client = Supabase.instance.client;
Future<Either<Failure, List<DetectionModel>>> getDetectionsForCurrentUser() async {
  try {
    final user = _client.auth.currentUser;
    if (user == null) return left(Failure("User not logged in"));

    final response = await _client
        .from('detection')
        .select()
        .eq('patient_id', user.id);

    final detections = (response as List)
        .map((e) => DetectionModel.fromMap(e))
        .toList();

    return right(detections);
  } catch (e) {
    return left(Failure(e.toString()));
  }
}


  /// ✅ Insert detection
Future<Either<Failure, Unit>> insertDetectionModel(DetectionModel model) async {
  try {
    final user = _client.auth.currentUser;
    if (user == null) return left(Failure("User not logged in"));

    final map = model.toMap();
    map['patient_id'] = user.id; // عشان نضمن إن اليوزر الحالي هو اللي بيضيف

    await _client.from('detection').insert(map);
    return right(unit);
  } catch (e) {
    return left(Failure(e.toString()));
  }
}

  /// ✅ Delete detection
  Future<Either<Failure, Unit>> deleteDetection(String id) async {
    try {
      await _client.from('detection').delete().eq('id', id);
      return right(unit);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
