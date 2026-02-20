import 'package:flutter/material.dart';

class BagConcentrationField extends StatelessWidget {
  final TextEditingController controller;

  const BagConcentrationField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'Concentração da bolsa',
          hintText: 'Ex: 2,5%',
        ),
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
      ),
    );
  }
}
