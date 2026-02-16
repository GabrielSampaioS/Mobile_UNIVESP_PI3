import 'package:flutter/material.dart';

class UltrafiltrationField extends StatelessWidget {
  final TextEditingController controller;

  const UltrafiltrationField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(labelText: 'NS'),
    );
  }
}
