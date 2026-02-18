class Cycles {
  final int value;

  Cycles(this.value) {
    if (value < 0) {
      throw Exception('O número de ciclos deve ser maior que 0');
    }
  }
}
