import 'package:flutter/material.dart';

class WeightField extends StatelessWidget {
  final TextEditingController controller;

  const WeightField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(labelText: 'Peso do paciente (kg)'),
    );
  }
}
