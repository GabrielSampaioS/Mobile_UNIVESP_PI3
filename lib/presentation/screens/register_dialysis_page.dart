import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mobile_univesp_pi3/features/dialysis/application/dialysis_controller.dart';
import 'package:mobile_univesp_pi3/core/widgets/fields/cycles_field.dart';
import 'package:mobile_univesp_pi3/core/widgets/fields/drain_aspect_field.dart';
import 'package:mobile_univesp_pi3/core/widgets/fields/end_time_field.dart';
import 'package:mobile_univesp_pi3/core/widgets/fields/initial_drainage_field.dart';
import 'package:mobile_univesp_pi3/core/widgets/fields/start_time_field.dart';
import 'package:mobile_univesp_pi3/core/widgets/fields/ultrafiltration_field.dart';
import 'package:mobile_univesp_pi3/core/widgets/fields/urine_volume_field.dart';
import 'package:mobile_univesp_pi3/core/widgets/fields/weight_field.dart';
import 'package:mobile_univesp_pi3/core/widgets/fields/bag_concentration_field.dart';

class RegisterDialysisPage extends StatefulWidget {
  const RegisterDialysisPage({super.key});

  @override
  State<RegisterDialysisPage> createState() => _RegisterDialysisPageState();
}

class _RegisterDialysisPageState extends State<RegisterDialysisPage> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  final weightController = TextEditingController();
  final bagConcentrationController = TextEditingController();
  final cyclesController = TextEditingController();
  final urineVolumeController = TextEditingController();
  final ultrafiltrationController = TextEditingController();
  final startTimeController = TextEditingController();
  final initialDrainageController = TextEditingController();
  final endTimeController = TextEditingController();
  final drainAspectController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Se ciclos é sempre 4:
    // cyclesController.text = '4';
  }

  @override
  void dispose() {
    weightController.dispose();
    bagConcentrationController.dispose();
    cyclesController.dispose();
    urineVolumeController.dispose();
    ultrafiltrationController.dispose();
    startTimeController.dispose();
    initialDrainageController.dispose();
    endTimeController.dispose();
    drainAspectController.dispose();
    super.dispose();
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    try {
      final controller = context.read<DialysisController>(); // ✅ Provider aqui

      await controller.saveFromForm(
        weight: weightController.text,
        startTime: startTimeController.text,
        endTime: endTimeController.text,
        cycles: cyclesController.text,
        ultrafiltration: ultrafiltrationController.text,
        urineVolume: urineVolumeController.text,
        drainAspect: drainAspectController.text,
        initialDrainage: initialDrainageController.text,
      );

      showMessage("Registro salvo com sucesso!");
      _clearFields();

      // Se você quer voltar pra Home depois de salvar:
      // if (mounted) Navigator.pop(context);

      // Se quer ficar na tela e ir pro próximo item, dá pra focar no primeiro campo aqui.
    } catch (e) {
      showMessage("Erro: $e");
    }

    if (mounted) setState(() => isLoading = false);
  }

  void _clearFields() {
    weightController.clear();
    bagConcentrationController.clear();
    cyclesController.clear();
    urineVolumeController.clear();
    ultrafiltrationController.clear();
    startTimeController.clear();
    initialDrainageController.clear();
    endTimeController.clear();
    drainAspectController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Informações da hemodiálise')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              StartTimeField(controller: startTimeController),
              EndTimeField(controller: endTimeController),

              BagConcentrationField(controller: bagConcentrationController),
              CyclesField(controller: cyclesController),
              DrainAspectField(controller: drainAspectController),
              InitialDrainageField(controller: initialDrainageController),
              UltrafiltrationField(controller: ultrafiltrationController),
              UrineVolumeField(controller: urineVolumeController),
              WeightField(controller: weightController),

              const SizedBox(height: 12),

              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: _save,
                      child: const Text("Salvar"),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
