


import 'package:mobile_univesp_pi3/features/dialysis/domain/dialysis_repository.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/entities/dialysis_record.dart';

class DialysisRepositoryFake implements DialysisRepository {
  final List<DialysisRecord> _storege = [];

  @override
  Future<List<DialysisRecord>> getAll() async {
    return List.unmodifiable(_storege);
  }

  @override
  Future<void> save(DialysisRecord record) async {
    _storege.add(record);
  }
}
