import 'package:flutter/material.dart';
import 'package:quotes_app/src/features/random_quote/presentation/widgets/quote_view_body.dart';

class QuoteView extends StatelessWidget {
  const QuoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: QuoteViewBody(),
    );
  }
}
