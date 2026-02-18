import 'package:flutter/material.dart';

class InitialDrainageField extends StatelessWidget {
  final TextEditingController controller;

  const InitialDrainageField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.datetime,
        decoration: const InputDecoration(
          labelText: 'Drenagem inicial (mL)',
          hintText: 'Ex: 500',
        ),
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
      ),
    );
  }
}
