import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/src/config/routes/app_routes.dart';
import 'package:quotes_app/src/core/utils/app_strings.dart';
import 'package:quotes_app/src/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:quotes_app/src/features/random_quote/presentation/widgets/quote_view_body.dart';

class QuoteView extends StatelessWidget {
  const QuoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () =>
          BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote(),
      child: Scaffold(
        appBar: _appBar(context),
        body: const QuoteViewBody(),
      ),
    );
  }

  AppBar _appBar(context) => AppBar(
        title: const Text(AppStrings.appTitle),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.favoriteViewRoute);
            },
            icon: const Icon(Icons.bookmark),
          ),
        ],
      );
}
