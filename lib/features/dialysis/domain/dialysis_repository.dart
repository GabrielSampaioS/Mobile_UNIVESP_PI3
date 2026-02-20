import 'package:mobile_univesp_pi3/features/dialysis/domain/entities/dialysis_record.dart';

abstract class DialysisRepository {
  Future<void> save(DialysisRecord record);
  Future<void> update(DialysisRecord record);
  Future<List<DialysisRecord>> getAll();
}
