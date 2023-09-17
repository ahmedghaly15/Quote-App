import 'package:dartz/dartz.dart';
import 'package:quotes_app/src/core/errors/failure.dart';
import 'package:quotes_app/src/core/usecases/usecases.dart';
import 'package:quotes_app/src/features/random_quote/domain/entities/quote.dart';
import 'package:quotes_app/src/features/random_quote/domain/repositories/quote_repo.dart';

class GetRandomQuote implements UseCases<Quote, NoParams> {
  final QuoteRepo quoteRepo;

  const GetRandomQuote({required this.quoteRepo});

  @override
  Future<Either<Failure, Quote>> call(NoParams params) =>
      quoteRepo.getRandomQuote();
}
