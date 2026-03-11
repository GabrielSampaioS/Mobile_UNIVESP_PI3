import 'package:flutter/material.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/entities/dialysis_record.dart';
import 'package:provider/provider.dart';

import 'package:mobile_univesp_pi3/features/dialysis/application/dialysis_controller.dart';
import 'package:mobile_univesp_pi3/presentation/widgets/fields/cycles_field.dart';
import 'package:mobile_univesp_pi3/presentation/widgets/fields/drain_aspect_field.dart';
import 'package:mobile_univesp_pi3/presentation/widgets/fields/end_time_field.dart';
import 'package:mobile_univesp_pi3/presentation/widgets/fields/initial_drainage_field.dart';
import 'package:mobile_univesp_pi3/presentation/widgets/fields/start_time_field.dart';
import 'package:mobile_univesp_pi3/presentation/widgets/fields/ultrafiltration_field.dart';
import 'package:mobile_univesp_pi3/presentation/widgets/fields/urine_volume_field.dart';
import 'package:mobile_univesp_pi3/presentation/widgets/fields/weight_field.dart';
import 'package:mobile_univesp_pi3/presentation/widgets/fields/bag_concentration_field.dart';

class RegisterDialysisPage extends StatefulWidget {
  final DialysisRecord? existing;

  const RegisterDialysisPage({super.key, this.existing});

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
    final record = widget.existing;
    if (record != null) {
      startTimeController.text = record.startTime.toString();
      endTimeController.text = record.endTime.toString();
      weightController.text = record.weight.value.toString();
      cyclesController.text = record.cycles.value.toString();
      ultrafiltrationController.text = record.ultrafiltration.value.toString();
      urineVolumeController.text = record.urineVolume.value.toString();
      initialDrainageController.text = record.initialDrainage.toString();
      drainAspectController.text = record.drainAspect.value;
      bagConcentrationController.text = record.bagConcentration.value
          .toString();
    }
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
      final controller = context.read<DialysisController>(); // Provider

      if (widget.existing == null) {
        //criar
        await controller.createFromForm(
          weight: weightController.text,
          startTime: startTimeController.text,
          endTime: endTimeController.text,
          cycles: cyclesController.text,
          ultrafiltration: ultrafiltrationController.text,
          urineVolume: urineVolumeController.text,
          drainAspect: drainAspectController.text,
          initialDrainage: initialDrainageController.text,
          bagConcentration: bagConcentrationController.text,
        );
      } else {
        //Update TODO Gambiarram atualizar
        await controller.updateFromForm(
          existing: widget.existing!,
          weight: weightController.text,
          startTime: startTimeController.text,
          endTime: endTimeController.text,
          cycles: cyclesController.text,
          ultrafiltration: ultrafiltrationController.text,
          urineVolume: urineVolumeController.text,
          drainAspect: drainAspectController.text,
          initialDrainage: initialDrainageController.text,
          bagConcentration: bagConcentrationController.text,
        );
      }

      showMessage("Registro salvo com sucesso!");

      if (mounted) Navigator.pop(context);
    } catch (e) {
      showMessage("Erro: $e");
    }

    if (mounted) setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações da hemodiálise'),
        backgroundColor: theme.colorScheme.secondary,
      ),
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
