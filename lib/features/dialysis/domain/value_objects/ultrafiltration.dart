class Ultrafiltration {
  final double value;

  Ultrafiltration(this.value) {
    if (value < 0) {
      throw Exception('Ultrafiltração não pode ser negativa');
    }
  }
}
