import 'package:flutter/material.dart';

class InitialDrainageField extends StatelessWidget {
  final TextEditingController controller;

  const InitialDrainageField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(labelText: 'Ns'),
    );
  }
}
