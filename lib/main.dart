import 'package:flutter/cupertino.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/usecases/delete_dialysis_record.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/usecases/update_dialysis_record.dart';
import 'package:provider/provider.dart';

import 'package:mobile_univesp_pi3/app/app.dart';
import 'package:mobile_univesp_pi3/features/dialysis/application/dialysis_controller.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/usecases/get_all_dialysis_record.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/usecases/save_dialysis_record.dart';
import 'package:mobile_univesp_pi3/features/dialysis/infrastructure/dialysis_repository_in_memory.dart';

void main() {
  // Composition Root
  //TODO Separar em arquivo diferente
  final repository = DialysisRepositoryInMemory();
  final save = SaveDialysisRecord(repository);
  final getAll = GetAllDialysisRecord(repository);
  final update = UpdateDialysisRecord(repository);
  final delete = DeleteDialysisRecord(repository);

  runApp(
    MultiProvider(
      providers: [
        Provider<DialysisRepositoryInMemory>.value(value: repository),

        // se seu DialysisController virar ChangeNotifier:
        ChangeNotifierProvider(
          create: (_) => DialysisController(
            save: save,
            getAll: getAll,
            update: update,
            delete: delete,
          )..load(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
