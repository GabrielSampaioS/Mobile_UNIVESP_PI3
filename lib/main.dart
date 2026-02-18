import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:mobile_univesp_pi3/app/app.dart';
import 'package:mobile_univesp_pi3/features/dialysis/application/dialysis_controller.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/usecases/get_all_dialysis_record.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/usecases/save_dialysis_record.dart';
import 'package:mobile_univesp_pi3/features/dialysis/infrastructure/dialysis_repository_fake.dart';

void main() {
  // Composition Root
  //TODO Separar em arquivo diferente
  final repository = DialysisRepositoryFake();
  final save = SaveDialysisRecord(repository);
  final getAll = GetAllDialysisRecord(repository);

  runApp(
    MultiProvider(
      providers: [
        Provider<DialysisRepositoryFake>.value(value: repository),

        // se seu DialysisController virar ChangeNotifier:
        ChangeNotifierProvider(
          create: (_) => DialysisController(save: save, getAll: getAll)..load(),
        ),

        // ✅ Se seu DialysisController ainda NÃO for ChangeNotifier,
        // use Provider normal:
        // Provider(
        //   create: (_) => DialysisController(save: save, getAll: getAll),
        // ),
      ],
      child: const MyApp(),
    ),
  );
}
