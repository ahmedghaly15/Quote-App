import 'package:quotes_app/src/core/api/api_consumer.dart';
import 'package:quotes_app/src/core/api/end_points.dart';

import 'package:quotes_app/src/features/random_quote/data/models/quote_model.dart';

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource {
  final ApiConsumer apiConsumer;

  const RandomQuoteRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<QuoteModel> getRandomQuote() async {
    final response = await apiConsumer.get(EndPoints.randomQuote);

    return QuoteModel.fromJson(response);
  }
}
