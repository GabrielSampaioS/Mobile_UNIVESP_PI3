import 'package:mobile_univesp_pi3/features/dialysis/domain/entities/dialysis_record.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/dialysis_repository.dart';

class SaveDialysisRecord {
  final DialysisRepository repository;

  SaveDialysisRecord(this.repository);

  Future<void> call(DialysisRecord record) {
    return repository.save(record);
  }
}
