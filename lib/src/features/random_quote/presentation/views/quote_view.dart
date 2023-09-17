import 'package:flutter/material.dart';
import 'package:quotes_app/src/core/utils/app_strings.dart';
import 'package:quotes_app/src/features/random_quote/presentation/widgets/quote_view_body.dart';

class QuoteView extends StatelessWidget {
  const QuoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: const QuoteViewBody(),
    );
  }

  AppBar _appBar() => AppBar(
        title: const Text(AppStrings.appTitle),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              // TODO: navigate to favorite screen
            },
            icon: const Icon(Icons.bookmark),
          ),
        ],
      );
}
