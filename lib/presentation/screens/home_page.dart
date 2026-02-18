import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_univesp_pi3/presentation/screens/dialysis_list.dart';
import 'package:provider/provider.dart';

import 'package:mobile_univesp_pi3/features/dialysis/application/dialysis_controller.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  void initState() {
    super.initState();
    // ✅ carrega uma vez quando entra na Home
    Future.microtask(() => context.read<DialysisController>().load());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = context.watch<DialysisController>();

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: theme.colorScheme.secondary,
        toolbarHeight: 56,
        automaticallyImplyLeading: false,
        leading: const Tooltip(
          message: 'Configurações',
          child: Icon(Icons.photo_camera_front_outlined),
        ),
        title: const Text('Olá'),
        actions: [
          IconButton(
            tooltip: "Sair",
            onPressed: () => showMessage(context, 'Sair'),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),

      body: controller.loading
          ? const Center(child: CircularProgressIndicator())
          : DialysisList(
              items: controller.records,
              onEdit: (item) async {
                await context.push('/registerDialysis', extra: item);
                // opcional: se sua tela de salvar já chama load() no controller, não precisa disso
                await context.read<DialysisController>().load();
              },
              onDelete: (item) async {
                // quando você implementar delete no controller:
                // await context.read<DialysisController>().delete(item.id);
                showMessage(context, 'Implementar excluir');
              },
            ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/registerDialysis'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
        elevation: 2,
        child: const Icon(Icons.add),
      ),
    );
  }
}
