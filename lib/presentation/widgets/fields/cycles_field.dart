import 'package:flutter/material.dart';

class CyclesField extends StatelessWidget {
  final TextEditingController controller;

  const CyclesField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(labelText: 'Quantidade de ciclos'),
    );
  }
}
