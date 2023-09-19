import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/quote_entity.dart';

abstract class QuoteRepo {
  Future<Either<Failure, QuoteEntity>> getRandomQuote();
}
