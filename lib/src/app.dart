import 'package:flutter/material.dart';
import 'package:quotes_app/src/features/random_quote/presentation/views/quote_view.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: QuoteView(),
      ),
    );
  }
}
