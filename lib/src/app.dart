import 'package:flutter/material.dart';
import 'package:quotes_app/src/config/routes/app_routes.dart';
import 'package:quotes_app/src/config/themes/app_theme.dart';
import 'package:quotes_app/src/core/utils/app_strings.dart';
import 'package:quotes_app/src/features/random_quote/presentation/views/quote_view.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      theme: appTheme(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
