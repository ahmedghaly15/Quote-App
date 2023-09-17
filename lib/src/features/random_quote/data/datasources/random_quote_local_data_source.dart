import 'dart:convert';

import 'package:quotes_app/src/core/errors/exception.dart';
import 'package:quotes_app/src/core/utils/app_strings.dart';
import 'package:quotes_app/src/features/random_quote/data/models/quote_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RandomQuoteLocalDataSource {
  Future<QuoteModel> getLastRandomQuote();

  Future<void> cacheQuote(QuoteModel quote);
}

class RandomQuoteLocalDataSourceImpl implements RandomQuoteLocalDataSource {
  final SharedPreferences sharedPreferences;

  const RandomQuoteLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<QuoteModel> getLastRandomQuote() {
    final String? jsonString =
        sharedPreferences.getString(AppStrings.cachedRandomQuote);

    if (jsonString != null) {
      final cachedRandomQuote =
          Future.value(QuoteModel.fromJson(json.decode(jsonString)));
      return cachedRandomQuote;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheQuote(QuoteModel quote) {
    return sharedPreferences.setString(
      AppStrings.cachedRandomQuote,
      json.encode(quote),
    );
  }
}
