class UrineVolume {
  final double value;

  UrineVolume._(this.value);

  factory UrineVolume(double value) {
    if (value < 0) {
      throw Exception('Volume urinário não pode ser negativo');
    }

    return UrineVolume._(value);
  }
}
