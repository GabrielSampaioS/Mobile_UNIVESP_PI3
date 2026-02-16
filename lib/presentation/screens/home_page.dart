import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,

      appBar: AppBar(
        elevation: 2,
        backgroundColor: theme.colorScheme.secondary,
        toolbarHeight: 56,
        automaticallyImplyLeading: false,

        leading: Tooltip(
          message: 'Configurações',
          child: Icon(Icons.photo_camera_front_outlined),
        ),

        title: Text('Olá'),
        actions: [
          IconButton(
            tooltip: "Sair",
            onPressed: () => showMessage(context, 'Sair'),
            icon: const Icon(Icons.logout),
          ),
        ],
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
