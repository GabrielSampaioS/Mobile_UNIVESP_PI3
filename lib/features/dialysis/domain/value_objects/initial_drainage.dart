
class GlucoseConcentration {
  final double value;

  GlucoseConcentration._(this.value);

  factory GlucoseConcentration(double value) {
    if (value <= 0) {
      throw Exception('Denagem deve ser maior que zero');
    }
    return GlucoseConcentration._(value);
  }
}
