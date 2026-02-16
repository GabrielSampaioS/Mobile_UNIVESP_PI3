import 'package:flutter/material.dart';

class DrainAspectField extends StatelessWidget {
  final TextEditingController controller;

  const DrainAspectField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(labelText: 'Aspecto'),
    );
  }
}
