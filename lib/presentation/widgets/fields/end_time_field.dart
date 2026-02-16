import 'package:flutter/material.dart';

class EndTimeField extends StatelessWidget {
  final TextEditingController controller;

  const EndTimeField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.datetime,
      decoration: const InputDecoration(labelText: 'Hora que acabou'),
    );
  }
}
