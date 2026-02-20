import 'package:flutter/material.dart';

class UrineVolumeField extends StatelessWidget {
  final TextEditingController controller;

  const UrineVolumeField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'Urina 24h (mL)',
          hintText: 'Ex: 1200',
        ),
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
      ),
    );
  }
}
