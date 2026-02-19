import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/entities/dialysis_record.dart';

class DialysisList extends StatelessWidget {
  final List<DialysisRecord> items;
  final void Function(DialysisRecord item) onEdit;
  final void Function(DialysisRecord item) onDelete;

  const DialysisList({
    super.key,
    required this.items,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(child: Text('Nenhum registro salvo ainda.'));
    }

    final df = DateFormat('dd/MM/yy');

    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final item = items[index];

        return Card(
          elevation: 1,
          child: ListTile(
            title: Text(
              '${df.format(item.date)} ${item.startTime}–${item.endTime}',
            ),
            subtitle: Text(
              'Peso: ${item.weight.value} kg • Ciclos: ${item.cycles.value}',
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  tooltip: 'Editar',
                  icon: const Icon(Icons.edit),
                  onPressed: () => onEdit(item),
                ),
                IconButton(
                  tooltip: 'Excluir',
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () => _confirmDelete(context, item),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _confirmDelete(BuildContext context, DialysisRecord item) {
    showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Excluir registro?'),
        content: const Text('Essa ação não pode ser desfeita.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              onDelete(item);
            },
            child: const Text('Excluir'),
          ),
        ],
      ),
    );
  }
}
