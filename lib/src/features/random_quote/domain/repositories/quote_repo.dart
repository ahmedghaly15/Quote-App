import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/quote.dart';

abstract class QuoteRepo {
  Future<Either<Failure, Quote>> getRandomQuote();
}
