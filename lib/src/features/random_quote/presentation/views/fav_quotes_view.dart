import 'package:flutter/material.dart';
import 'package:quotes_app/src/config/locale/app_localizations.dart';
import 'package:quotes_app/src/features/random_quote/presentation/widgets/fav_quotes_view_body.dart';

class FavQuotesView extends StatelessWidget {
  const FavQuotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: const FavQuotesViewBody(),
    );
  }

  AppBar _appBar(BuildContext context) => AppBar(
        title:
            Text(AppLocalizations.of(context)!.translate('favorite_quotes')!),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      );
}
