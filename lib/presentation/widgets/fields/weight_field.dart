import 'package:flutter/material.dart';

class WeightField extends StatelessWidget {
  final TextEditingController controller;

  const WeightField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'Peso (kg)',
          hintText: 'Ex: 72.5',
        ),
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
      ),
    );
  }
}
