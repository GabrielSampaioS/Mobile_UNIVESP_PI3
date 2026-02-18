class UrineVolume {
  final double value;

  UrineVolume(this.value) {
    if (value < 0) {
      throw Exception('Volume urinário não pode ser negativo');
    }
  }
}
