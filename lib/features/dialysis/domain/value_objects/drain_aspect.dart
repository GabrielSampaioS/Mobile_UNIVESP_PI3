class DrainAspect {
  final String value;

  DrainAspect._(this.value);

  factory DrainAspect(String value) {
    if (value == '') {
      throw Exception('Aspecto deve ser informado');
    }

    return DrainAspect._(value);
  }
}
