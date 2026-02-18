class Weight {
  final double value;

  Weight(this.value) {
    if (value <= 0) {
      throw Exception('Peso deve ser maior que zero');
    }
  }
}
