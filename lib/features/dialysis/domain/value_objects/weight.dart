class Weight {
  final double value;

  Weight._(this.value);

  factory Weight(double value) {
    if (value <= 0) {
      throw Exception('Peso deve ser maior que zero');
    }
    if (value > 300) {
      throw ArgumentError('Peso irrealista para paciente de diálise');
    }

    return Weight._(value);
  }
  // TODO: Implementar igualdade baseada em valor (override == e hashCode))
  // quando a comparação entre instâncias se tornar necessária.
}
