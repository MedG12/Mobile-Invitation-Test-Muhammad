import 'package:compentency_test_muhammad/config/locator.dart';
import 'package:compentency_test_muhammad/config/routes/app_router.dart';
import 'package:compentency_test_muhammad/config/theme/app_themes.dart';
import 'package:compentency_test_muhammad/presentations/pages/first_page.dart';
import 'package:compentency_test_muhammad/presentations/providers/palindrome_Viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  final _appRouter = AppRouter();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => sl<PalindromeViewModel>()),
      ],

      child: MaterialApp.router(
        theme: theme(),
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.router,
      ),
    ),
  );
}
