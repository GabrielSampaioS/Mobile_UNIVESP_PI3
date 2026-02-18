import 'package:flutter/foundation.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/entities/dialysis_record.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/usecases/save_dialysis_record.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/usecases/get_all_dialysis_record.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/value_objects/cycles.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/value_objects/dialysis_time.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/value_objects/ultrafiltration.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/value_objects/urine_volume.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/value_objects/weight.dart';

class DialysisController extends ChangeNotifier {
  final SaveDialysisRecord save;
  final GetAllDialysisRecord getAll;

  DialysisController({required this.save, required this.getAll});

  List<DialysisRecord> _records = [];
  List<DialysisRecord> get records => List.unmodifiable(_records);

  bool _loading = false;
  bool get loading => _loading;

  Future<void> load() async {
    _loading = true;
    notifyListeners();

    _records = await getAll();

    _loading = false;
    notifyListeners();
  }

  Future<void> saveDialysisRecord({required DialysisRecord record}) async {
    await save(record);
    await load();
  }

  Future<void> saveFromForm({
    required String weight,
    required String startTime,
    required String endTime,
    required String cycles,
    required String ultrafiltration,
    required String urineVolume,
    required String drainAspect,
    required String initialDrainage,
  }) async {
    final record = DialysisRecord.create(
      date: DateTime.now(),
      weight: Weight(double.parse(weight)),
      startTime: DialysisTime.fromString(startTime),
      endTime: DialysisTime.fromString(endTime),
      cycles: Cycles(int.parse(cycles)),
      ultrafiltration: Ultrafiltration(double.parse(ultrafiltration)),
      urineVolume: UrineVolume(double.parse(urineVolume)),
      initialDrainage: double.parse(initialDrainage),
      drainAspect: drainAspect.toLowerCase() == 'blood'
          ? DrainAspect.blood
          : DrainAspect.clear,
    );

    await saveDialysisRecord(record: record);
  }
}
