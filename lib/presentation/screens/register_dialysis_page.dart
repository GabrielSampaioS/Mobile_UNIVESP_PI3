import 'package:flutter/material.dart';
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
  const RegisterDialysisPage({super.key});

  @override
  State<RegisterDialysisPage> createState() => _RegisterDialysisPageState();
}

class _RegisterDialysisPageState extends State<RegisterDialysisPage> {
  final _formKey = GlobalKey<FormState>();

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

  //teste

  void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        toolbarHeight: 56,

        backgroundColor: theme.colorScheme.secondary,
        title: Text(
          'Informações da hemodiálise',
          style: theme.textTheme.headlineMedium,
        ),
      ),

      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
          child: SizedBox(
            child: ListView(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      //CAMPOS
                      const SizedBox(height: 10),
                      BagConcentrationField(
                        controller: bagConcentrationController,
                      ),
                      const SizedBox(height: 20),

                      CyclesField(controller: cyclesController),
                      const SizedBox(height: 20),

                      DrainAspectField(controller: drainAspectController),
                      const SizedBox(height: 20),

                      EndTimeField(controller: endTimeController),
                      const SizedBox(height: 20),

                      InitialDrainageField(
                        controller: initialDrainageController,
                      ),
                      const SizedBox(height: 20),

                      StartTimeField(controller: startTimeController),
                      const SizedBox(height: 20),

                      UltrafiltrationField(
                        controller: ultrafiltrationController,
                      ),
                      const SizedBox(height: 20),

                      UrineVolumeField(controller: urineVolumeController),
                      const SizedBox(height: 20),

                      WeightField(controller: weightController),
                      const SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: () => showMessage(context, 'Salvar'),
                        child: const Text('Salvar'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
