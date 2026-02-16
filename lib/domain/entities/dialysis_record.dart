import '../value_objects/weight.dart';
import '../value_objects/cycles.dart';
import '../value_objects/ultrafiltration.dart';
import '../value_objects/urine_volume.dart';
import '../value_objects/dialysis_time.dart';
import '../value_objects/glucose_concentration.dart';

enum DrainAspect {
  clear,
  blood,
}

class DialysisRecord {
  final DateTime date;
  final Weight weight;
  final DialysisTime startTime;
  final DialysisTime endTime;
  final Cycles cycles;
  final double initialDrainage;
  final GlucoseConcentration glucoseConcentration;
  final Ultrafiltration ultrafiltration;
  final DrainAspect drainAspect;
  final UrineVolume urineVolume;

  DialysisRecord._({
    required this.date,
    required this.weight,
    required this.startTime,
    required this.endTime,
    required this.cycles,
    required this.initialDrainage,
    required this.glucoseConcentration,
    required this.ultrafiltration,
    required this.drainAspect,
    required this.urineVolume,
  });

  factory DialysisRecord.create({
    required DateTime date,
    required Weight weight,
    required DialysisTime startTime,
    required DialysisTime endTime,
    required Cycles cycles,
    required double initialDrainage,
    required GlucoseConcentration glucoseConcentration,
    required Ultrafiltration ultrafiltration,
    required DrainAspect drainAspect,
    required UrineVolume urineVolume,
  }) {
    // Regras de negócio do domínio

    if (endTime.value.isBefore(startTime.value)) {
      throw Exception('Horário final deve ser após o horário inicial');
    }

    if (initialDrainage < 0) {
      throw Exception('Drenagem inicial não pode ser negativa');
    }

    return DialysisRecord._(
      date: date,
      weight: weight,
      startTime: startTime,
      endTime: endTime,
      cycles: cycles,
      initialDrainage: initialDrainage,
      glucoseConcentration: glucoseConcentration,
      ultrafiltration: ultrafiltration,
      drainAspect: drainAspect,
      urineVolume: urineVolume,
    );
  }

  Duration get totalDuration =>
      endTime.value.difference(startTime.value);
}
