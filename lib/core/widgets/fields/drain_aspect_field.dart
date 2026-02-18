import 'package:flutter/material.dart';

class DrainAspectField extends StatelessWidget {
  final TextEditingController controller;

  const DrainAspectField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          labelText: 'Aspecto drenado',
          hintText: 'limpo',
        ),
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
      ),
    );
  }
}
