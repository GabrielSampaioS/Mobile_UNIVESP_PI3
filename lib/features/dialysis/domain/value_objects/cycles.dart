class Cycles {
  final int value;

  Cycles._(this.value);

  factory Cycles(int value) {
    if (value < 0) {
      throw Exception('O número de ciclos deve ser maior que 0');
    }

    return Cycles._(value);
  }
}
