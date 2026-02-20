import 'package:mobile_univesp_pi3/features/dialysis/domain/value_objects/bag_concentration.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/value_objects/drain_aspect.dart';
import 'package:uuid/uuid.dart';

import '../value_objects/weight.dart';
import '../value_objects/cycles.dart';
import '../value_objects/ultrafiltration.dart';
import '../value_objects/urine_volume.dart';
import '../value_objects/dialysis_time.dart';

//enum DrainAspect { clear, blood }

const Uuid _uuid = Uuid();

class DialysisRecord {
  final String id;
  final DateTime date;
  final Weight weight;
  final DialysisTime startTime;
  final DialysisTime endTime;
  final Cycles cycles;
  final double initialDrainage;
  final Ultrafiltration ultrafiltration;
  final DrainAspect drainAspect;
  final UrineVolume urineVolume;
  final BagConcentration bagConcentration;

  // Construtor privado
  DialysisRecord._({
    required this.id,
    required this.date,
    required this.weight,
    required this.startTime,
    required this.endTime,
    required this.cycles,
    required this.initialDrainage,
    required this.ultrafiltration,
    required this.drainAspect,
    required this.urineVolume,
    required this.bagConcentration,
  });

  // Factory para criação
  factory DialysisRecord.create({
    String? id,
    required DateTime date,
    required Weight weight, //weight
    required DialysisTime startTime, //dialysis_time
    required DialysisTime endTime, //dialysis_time
    required Cycles cycles, //cycles
    required double initialDrainage, //GlucoseConcentration
    required Ultrafiltration ultrafiltration, //Ultrafiltration
    required DrainAspect drainAspect, //DrainAspect
    required UrineVolume urineVolume, //UrineVolume
    required BagConcentration bagConcentration,
  }) {
    if (endTime.value.isBefore(startTime.value)) {
      throw Exception('Horário final deve ser após o horário inicial');
    }

    return DialysisRecord._(
      id: id ?? _uuid.v4(),
      date: date,
      weight: weight,
      startTime: startTime,
      endTime: endTime,
      cycles: cycles,
      initialDrainage: initialDrainage,
      ultrafiltration: ultrafiltration,
      drainAspect: drainAspect,
      urineVolume: urineVolume,
      bagConcentration: bagConcentration,
    );
  }

  // copyWith para UPDATE
  DialysisRecord copyWith({
    DateTime? date,
    Weight? weight,
    DialysisTime? startTime,
    DialysisTime? endTime,
    Cycles? cycles,
    double? initialDrainage,
    Ultrafiltration? ultrafiltration,
    DrainAspect? drainAspect,
    UrineVolume? urineVolume,
    BagConcentration? bagConcentration,
  }) {
    return DialysisRecord._(
      id: id,
      date: date ?? this.date,
      weight: weight ?? this.weight,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      cycles: cycles ?? this.cycles,
      initialDrainage: initialDrainage ?? this.initialDrainage,
      ultrafiltration: ultrafiltration ?? this.ultrafiltration,
      drainAspect: drainAspect ?? this.drainAspect,
      urineVolume: urineVolume ?? this.urineVolume,
      bagConcentration: bagConcentration ?? this.bagConcentration,
    );
  }

  Duration get totalDuration => endTime.value.difference(startTime.value);

  String debugFields() {
    return '''
DialysisRecord(
  id: $id,
  date: $date,
  weight: $weight,
  startTime: $startTime,
  endTime: $endTime,
  cycles: $cycles,
  initialDrainage: $initialDrainage,
  ultrafiltration: $ultrafiltration,
  drainAspect: $drainAspect,
  urineVolume: $urineVolume,
  BagConcentration' $bagConcentration,
)
''';
  }
}
