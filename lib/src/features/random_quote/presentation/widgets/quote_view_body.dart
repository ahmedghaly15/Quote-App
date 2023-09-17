import 'package:flutter/material.dart';

import '/src/features/random_quote/presentation/widgets/quote.dart';
import '/src/features/random_quote/presentation/widgets/refresh_icon_button.dart';

class QuoteViewBody extends StatelessWidget {
  const QuoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Quote(),
        RefreshIconButton(),
      ],
    );
  }
}
