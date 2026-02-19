class Ultrafiltration {
  final double value;

  Ultrafiltration._(this.value);

  factory Ultrafiltration(double value) {
    if (value < 0) {
      throw Exception('Ultrafiltração não pode ser negativa');
    }

    return Ultrafiltration._(value);
  }
}
