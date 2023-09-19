import 'package:dartz/dartz.dart';
import 'package:quotes_app/src/core/errors/failure.dart';
import 'package:quotes_app/src/core/usecases/usecases.dart';
import 'package:quotes_app/src/features/random_quote/domain/entities/quote_entity.dart';
import 'package:quotes_app/src/features/random_quote/domain/repositories/quote_repo.dart';

class GetRandomQuote implements UseCases<QuoteEntity, NoParams> {
  final QuoteRepo quoteRepo;

  const GetRandomQuote({required this.quoteRepo});

  @override
  Future<Either<Failure, QuoteEntity>> call(NoParams params) =>
      quoteRepo.getRandomQuote();
}
