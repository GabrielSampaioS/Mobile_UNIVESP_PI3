import 'package:flutter/material.dart';

class StartTimeField extends StatelessWidget {
  final TextEditingController controller;

  const StartTimeField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(labelText: 'Hora de inicio'),
    );
  }
}
