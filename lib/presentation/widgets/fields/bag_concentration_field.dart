import 'package:flutter/material.dart';

class BagConcentrationField extends StatelessWidget {
  final TextEditingController controller;

  const BagConcentrationField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(labelText: 'Concentração %'),
    );
  }
}
