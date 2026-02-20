import 'package:go_router/go_router.dart';
import 'package:mobile_univesp_pi3/features/dialysis/domain/entities/dialysis_record.dart';
import 'package:mobile_univesp_pi3/presentation/screens/home_page.dart';
import 'package:mobile_univesp_pi3/presentation/screens/register_dialysis_page.dart';

GoRouter createRouter() {
  return GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const Homepage(),
      ),
      GoRoute(
        path: '/registerDialysis',
        builder: (context, state) {
          final record = state.extra as DialysisRecord?;
          return RegisterDialysisPage(existing: record);
        },
      ),
    ],
  );
}
