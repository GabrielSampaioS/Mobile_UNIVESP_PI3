import 'package:flutter/material.dart';

class UltrafiltrationField extends StatelessWidget {
  final TextEditingController controller;

  const UltrafiltrationField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'Ultrafiltração (mL)',
          hintText: 'Ex: 800',
        ),
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
      ),
    );
  }
}
