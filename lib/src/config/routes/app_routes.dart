import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/locator.dart';
import 'package:quotes_app/src/features/favorite_quotes/presentation/views/favorite_quotes.dart';
import 'package:quotes_app/src/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:quotes_app/src/features/random_quote/presentation/views/quote_view.dart';

class Routes {
  static const String initialRoute = '/';
  static const String favoriteViewRoute = '/favoriteView';
}

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                serviceLocator.get<RandomQuoteCubit>()..getRandomQuote(),
            child: const QuoteView(),
          ),
        );

      case Routes.favoriteViewRoute:
        return MaterialPageRoute(
          builder: (context) => const FavoriteQuotesView(),
        );

      default:
        return unFoundRoute();
    }
  }

  static Route<dynamic> unFoundRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text("Un Found Route"),
        ),
      ),
    );
  }
}
