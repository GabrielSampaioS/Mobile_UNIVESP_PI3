import 'package:flutter/foundation.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/entities/dialysis_record.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/usecases/delete_dialysis_record.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/usecases/save_dialysis_record.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/usecases/get_all_dialysis_record.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/usecases/update_dialysis_record.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/value_objects/bag_concentration.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/value_objects/cycles.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/value_objects/dialysis_time.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/value_objects/drain_aspect.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/value_objects/ultrafiltration.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/value_objects/urine_volume.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/value_objects/weight.dart';

class DialysisController extends ChangeNotifier {
  final SaveDialysisRecord save;
  final GetAllDialysisRecord getAll;
  final UpdateDialysisRecord update;
  final DeleteDialysisRecord delete;

  DialysisController({
    required this.save,
    required this.getAll,
    required this.update,
    required this.delete
  });

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

  // CRIAR
  Future<void> createFromForm({
    required String weight,
    required String startTime,
    required String endTime,
    required String cycles,
    required String ultrafiltration,
    required String urineVolume,
    required String drainAspect,
    required String initialDrainage,
    required String bagConcentration,
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
      drainAspect: DrainAspect(drainAspect.toLowerCase()),
      bagConcentration: BagConcentration(double.parse(bagConcentration)),
    );

    await save(record);
    await load();
  }

  // ATUALIZAR
  Future<void> updateFromForm({
    required DialysisRecord existing,
    required String weight,
    required String startTime,
    required String endTime,
    required String cycles,
    required String ultrafiltration,
    required String urineVolume,
    required String drainAspect,
    required String initialDrainage,
    required String bagConcentration,
  }) async {
    final updated = existing.copyWith(
      weight: Weight(double.parse(weight)),
      startTime: DialysisTime.fromString(startTime),
      endTime: DialysisTime.fromString(endTime),
      cycles: Cycles(int.parse(cycles)),
      ultrafiltration: Ultrafiltration(double.parse(ultrafiltration)),
      urineVolume: UrineVolume(double.parse(urineVolume)),
      initialDrainage: double.parse(initialDrainage),
      drainAspect: DrainAspect(drainAspect.toLowerCase()),
      bagConcentration: BagConcentration(double.parse(bagConcentration)),
    );

    await update(updated);
    await load();
  }
}
