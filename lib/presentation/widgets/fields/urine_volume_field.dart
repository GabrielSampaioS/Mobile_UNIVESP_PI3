import 'package:flutter/material.dart';

class UrineVolumeField extends StatelessWidget {
  final TextEditingController controller;

  const UrineVolumeField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(labelText: 'Volume de urina (mL)'),
    );
  }
}
