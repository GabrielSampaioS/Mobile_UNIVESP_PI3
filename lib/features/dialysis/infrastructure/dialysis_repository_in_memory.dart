import 'package:mobile_univesp_pi3/features/dialysis/domain/dialysis_repository.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/entities/dialysis_record.dart';

class DialysisRepositoryInMemory implements DialysisRepository {
  final List<DialysisRecord> _storage = [];

  @override
  Future<List<DialysisRecord>> getAll() async {
    return List.unmodifiable(_storage);
  }

  @override
  Future<void> save(DialysisRecord record) async {
    _storage.add(record);
  }

  @override
  Future<void> update(DialysisRecord record) async {
    final index = _storage.indexWhere((r) => r.id == record.id);

    if (index == -1) {
      throw Exception('Registro não encontrado para atualizar.');
    }
    _storage[index] = record;
  }
  
  @override
  Future<void> delete(DialysisRecord record) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
