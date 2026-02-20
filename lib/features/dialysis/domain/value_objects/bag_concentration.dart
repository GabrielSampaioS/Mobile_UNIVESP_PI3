class BagConcentration {
  final double value;

  BagConcentration._(this.value);

  factory BagConcentration(double value) {
    if (value <= 0) {
      throw Exception('Concentração deve ser maior que zero');
    }
    return BagConcentration._(value);
  }
}
