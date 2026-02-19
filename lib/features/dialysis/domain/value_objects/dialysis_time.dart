class DialysisTime {
  final DateTime value;

  DialysisTime._(this.value);

  factory DialysisTime.fromString(String input) {
    final regex = RegExp(r'^([01]\d|2[0-3]):([0-5]\d)$');

    if (!regex.hasMatch(input)) {
      throw ArgumentError('Formato inválido (HH:mm)');
    }

    final parts = input.split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);

    final now = DateTime.now();

    return DialysisTime._(DateTime(now.year, now.month, now.day, hour, minute));
  }
  @override
  String toString() {
    final hour = value.hour.toString().padLeft(2, '0');
    final minute = value.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}
