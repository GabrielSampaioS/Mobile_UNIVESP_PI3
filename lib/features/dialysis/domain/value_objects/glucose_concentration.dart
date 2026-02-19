class GlucoseConcentration {
  final double value;

  GlucoseConcentration._(this.value);

  factory GlucoseConcentration(double value) {
    if (value <= 0) {
      throw Exception('Concentração deve ser maior que zero');
    }
    return GlucoseConcentration._(value);
  }
}
