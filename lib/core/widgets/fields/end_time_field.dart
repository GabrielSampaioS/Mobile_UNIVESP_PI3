import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_univesp_pi3/core/formatters/time_input_formatter.dart';

class EndTimeField extends StatelessWidget {
  final TextEditingController controller;

  const EndTimeField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.datetime,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(4),
          TimeInputFormatter(),
        ],
        decoration: const InputDecoration(
          labelText: 'Fim (HH:mm)',
          hintText: 'Ex: 13:00',
        ),
        onEditingComplete: () => FocusScope.of(context).nextFocus(),

        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Informe a hora';
          }

          /*final regex = RegExp(r'^([01]\d|2[0-3]):([0-5]\d)$');
          if (!regex.hasMatch(value)) {
            return 'Formato inválido (HH:mm)';
          }*/

          return null;
        },
      ),
    );
  }
}
