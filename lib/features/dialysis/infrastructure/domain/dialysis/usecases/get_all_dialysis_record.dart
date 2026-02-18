
import 'package:mobile_univesp_pi3/features/dialysis/domain/dialysis_repository.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/entities/dialysis_record.dart';

class GetAllDialysisRecord {
  final DialysisRepository repository;

  GetAllDialysisRecord(this.repository);

  Future<List<DialysisRecord>> call() {
    return repository.getAll();
  }
}
