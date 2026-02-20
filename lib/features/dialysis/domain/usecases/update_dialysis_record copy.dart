import 'package:mobile_univesp_pi3/features/dialysis/domain/dialysis_repository.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/entities/dialysis_record.dart';

class UpdateDialysisRecord {
  final DialysisRepository repository;

  UpdateDialysisRecord(this.repository);

  Future<void> call(DialysisRecord record) {
    return repository.update(record);
  }
}
