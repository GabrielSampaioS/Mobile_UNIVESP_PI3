import 'package:flutter/material.dart';

class CyclesField extends StatelessWidget {
  final TextEditingController controller;

  const CyclesField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'Ciclos',
          hintText: 'Ex: 4',
        ),
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
      ),
    );
  }
}
