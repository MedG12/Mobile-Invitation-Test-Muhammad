import 'package:compentency_test_muhammad/presentations/pages/first_page.dart';
import 'package:compentency_test_muhammad/presentations/pages/second_page.dart';
import 'package:compentency_test_muhammad/presentations/pages/third_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  late final GoRouter router;

  AppRouter() {
    router = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: '/first',
      routes: [
        GoRoute(path: '/first', builder: (context, state) => FirstPage()),
        GoRoute(path: '/second', builder: (context, state) => SecondPage()),
        GoRoute(path: '/third', builder: (context, state) => ThirdPage()),
      ],
    );
  }
}
