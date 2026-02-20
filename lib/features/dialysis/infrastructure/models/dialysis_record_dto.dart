class DialysisRecordDto {
  final DateTime date;

  final String id;

  final String startTime;
  final String endTime;

  final String bagConcentration;
  final int cycles;

  final String drainAspect;
  final double initialDrainage;
  final double ultrafiltration;
  final double urineVolume;

  final double weight;

  DialysisRecordDto({
    required this.date,
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.bagConcentration,
    required this.cycles,
    required this.drainAspect,
    required this.initialDrainage,
    required this.ultrafiltration,
    required this.urineVolume,
    required this.weight,
  });
}
