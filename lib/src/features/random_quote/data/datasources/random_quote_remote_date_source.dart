import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quotes_app/src/core/api/end_points.dart';
import 'package:quotes_app/src/core/errors/exception.dart';
import 'package:quotes_app/src/core/utils/app_strings.dart';

import 'package:quotes_app/src/features/random_quote/data/models/quote_model.dart';

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource {
  final http.Client client;

  const RandomQuoteRemoteDataSourceImpl({required this.client});

  @override
  Future<QuoteModel> getRandomQuote() async {
    final randomQuoteUrl = Uri.parse(EndPoints.randomQuote);

    final response = await client.get(
      randomQuoteUrl,
      headers: {
        AppStrings.contentType: AppStrings.applicationJson,
      },
    );

    if (response.statusCode == 200) {
      return QuoteModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
